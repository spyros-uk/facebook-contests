<?php
/**
 * Read up on the WP Template Hierarchy for
 * when this file is used
 *
 */
?>
<?php get_header(); ?>

	<article class="hero">
		<div class="hero__content">

			<header>
				<h1 class="hero__title">
					The Best WordPress Theme Starter
				</h1>
			</header>

			<p>
				Build tools included! :)
			</p>

			<p>
				<strong>Happy Hacking!</strong>
			</p>

			<footer>

				<div class="hero__icon">
					<?php SDP_SVG::svg( 'medal' ); ?>
				</div>

				<div class="hero__credits">
					<p>
						Background image of Everest courtesy of <a target="_blank" href="https://unsplash.it/">Unsplash It.</a>
					</p>
					<p>
						SVG medal created by Creative Stall, from the <a target="_blank" href="https://thenounproject.com/creativestall/">Noun Project.</a>
					</p>
				</div>

			</footer>

		</div>
	</article>

<?php get_footer(); ?>