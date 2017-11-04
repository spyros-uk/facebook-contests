<?php
Class Component_Prize {
    public static function the_prize_background($contest) {
        $image_id = get_post_thumbnail_id( $contest->ID );

        SDP_Image::background(
            $image_id,
            'contest_background_small',
            array(
                'contest_background_medium' => '(min-width: 600px)',
                'contest_background_large' => '(min-width: 1024px)'),
            array(
                'class' => 'prize__background'
            ));
    }
}
?>