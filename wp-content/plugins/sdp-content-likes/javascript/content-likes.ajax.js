import 'jquery-serialize-object';

/**
 * Add or remove the likedClass
 * for the given content liker
 * submit buttons
 *
 * @param action
 * @param submitButtons
 */
function likedClass(action, submitButtons) {
	if (!$.inArray(action, ['add', 'remove'])) {
		throw new TypeError(`likedClass expects 'action' to be either 'add' or 'remove', "${action}" given.`);
	}

	submitButtons.each((index, button) => {
		const $button = $(button);
		const className = $button.data('mlikes-liked-class');

		$button[`${action}Class`](className);
	});
}


/**
 * Content Likes Actions
 * ajax handler
 *
 * @param ajaxUrl
 * @param extraParams
 */
export function handleContentLikeActions(ajaxUrl, extraParams) {
	if (!ajaxUrl || 'string' !== typeof ajaxUrl) {
		throw new TypeError(`ajaxUrl: "${ajaxUrl}", must be a valid URL for the content likes handler to work`);
	}


	/**
	 * Liker action keys
	 *
	 * @type object
	 */
	const ACTIONS = {
		like: 'mlikes_liker_like',
		unlike: 'mlikes_liker_unlike'
	};


	/**
	 * Handle liker form
	 * submissions
	 *
	 */
	$(document).on('submit', '[data-mlikes-liker]', event => {
		event.preventDefault();

		const form = $(event.currentTarget);
		const formID = form.data('mlikes-liker');
		const formData = form.serializeObject();

		const forms = $('[data-mlikes-liker="' + formID + '"]');
		const nonceFields = forms.find('[name="_wpnonce"]');
		const actionFields = forms.find('[name="action"]');
		const submitButtons = forms.find('button[type="submit"]');

		submitButtons.attr('disabled', true);

		let details = {
			elements: {forms, submitButtons},
			formData,
			formID,
			event
		};

		form.trigger(
			'mlikes:start',
			details
		);

		$.post(ajaxUrl, $.extend(formData, extraParams), 'json')
			.fail(error => form.trigger('mlikes:fail', $.extend(details, {error})))
			.done(({success, data}) => {
				if (!success) {
					return form.trigger('mlikes:fail', $.extend(details, {error: data}));
				}

				likedClass(
					'like' === formData.action ? 'add' : 'remove',
					submitButtons
				);

				actionFields.val(ACTIONS[data.newAction]);
				nonceFields.val(data.newNonce);

				form.trigger(
					'mlikes:done',
					$.extend(details, {data})
				);
			})
			.always(response => {
				submitButtons.attr('disabled', false);

				form.trigger(
					'mlikes:always',
					$.extend(details, {response})
				);
			});
	});
}


/**
 * Update the user likes
 * counters
 *
 * @param userLikesCount
 *
 * @returns {Function}
 */
export function updateUserLikesCount({ userLikesCount }) {
	if ('number' === typeof userLikesCount) {
		$('[data-mlikes-user-likes-count]')
			.attr('data-mlikes-user-likes-count', userLikesCount)
			.text(userLikesCount);
	}
}
