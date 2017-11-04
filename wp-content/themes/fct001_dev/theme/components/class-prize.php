<?php
Class Component_Prize {

    static function get_image_id($contest) {
        $contest_id = is_object($contest) ? $contest->ID : $contest;
        return get_post_thumbnail_id( $contest_id );
    }

    public static function the_prize_background($contest) {

        SDP_Image::background(
            self::get_image_id($contest),
            'contest_background_small',
            array(
                'contest_background_medium' => '(min-width: 600px)',
                'contest_background_large' => '(min-width: 1024px)'),
            array(
                'class' => 'prize__background'
            ));
    }

    public static function the_prize_featured_picture($contest) {

        SDP_Image::picture(
            self::get_image_id($contest),
            'contest_background_small',
            array(
                'contest_background_medium' => '(min-width: 600px)',
                'contest_background_large' => '(min-width: 1024px)'),
            array(
                'class' => 'prize__featured-image'
            ));
    }
}
?>