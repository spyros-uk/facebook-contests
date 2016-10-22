<?php

class MSoc_Register_Settings{


    /**
     * Add Wp Action Hooks
     */
    function __construct(){
        add_action('admin_menu', array(&$this, 'create_social_settings'));
        add_action('admin_init', array(&$this, 'init'));
    }


    /**
     * Creates Social Feed Settings Page
     */
    function create_social_settings(){
        add_options_page('Social Feed Settings', 'Social Feed Settings', 'manage_options', 'social_feed', array(&$this, 'render_options_page'));
    }


    /**
     * Sets Social Media Connection Settings
     */
    function  init(){
        /**An config array containing the required options for connection*/

        $social_media = array(
            array(
                'name'=>'Facebook',
                'section'=>array('fb_section', 'Facebook Settings'),
                'settings'=>array(
                    array('fb_app_id', 'Application ID', 'text'),
                    array('fb_app_secret', 'Application Secret', 'text'),
                    array('fb_id', 'Page Id', 'text'),
                    array('fb_query_limit', 'Facebook Query Limit', 'text'),
                )
            ),
            array(
                'name'=>'Twitter',
                'section'=>array('twitter_section', 'Twitter Settings'),
                'settings'=>array(
                    array('twitter_query', 'Twitter Query String', 'text'),
                    array('twitter_consumer_key1', 'Twitter Consumer Key 1', 'text'),
                    array('twitter_consumer_key2', 'Twitter Consumer Key 2', 'text'),
                    array('twitter_token', 'Twitter Token', 'text'),
                    array('twitter_tag', 'Twitter Query Tag', 'text'),
                    array('twitter_query_limit', 'Twitter Query Limit', 'text')
                )
            ),
            array(
                'name'=>'Instagram',
                'section'=>array('intsagram_section', 'Instagram Settings'),
                'settings'=>array(
                    array('instagram_app_id', 'Instagram Client', 'text'),
                    array('instagram_tag', 'Instagram Tag', 'text'),
                    array('instagram_query_limit', 'Instagram Query Limit', 'text')
                )
            )

        );
        $this->set_settings($social_media);
        $this->generic_settings();
    }

    /**
     * Register Sections and Settings
     * for each Social Medium added on Init
     * @param $media
     */
    function set_settings($media){
        foreach($media as $medium) {
            $section = $medium['section'];
            add_settings_section($section[0], $section[1], array(&$this, 'render_settings_section'), 'social_feed');
            foreach ($medium['settings'] as $setting) {
                add_settings_field($setting[0], $setting[1], array(&$this, 'render_settings_fields'), 'social_feed', $section[0], array($setting[0], $setting[1], $setting[2]));
                register_setting('social_feed', $setting[0]);
            }
        }
    }

    /**
     * Register Generic Sections and Settings
     */
    function generic_settings(){
        add_settings_section('generic_settings', 'Generic Settings', array(&$this, 'render_settings_section'), 'social_feed');
        add_settings_field('allow_auto', 'Allow auto', array(&$this, 'render_settings_fields'), 'social_feed', 'generic_settings', array('allow_auto', 'Allow auto', 'checkbox'));
        register_setting('social_feed', 'allow_auto');
    }

    /**
     * Render Content for Social Feed Settings Page
     */
    function render_options_page(){
        echo '<h1>Social Media Settings</h1>';
        echo '<form method="POST" action="options.php">';
        settings_fields( 'social_feed' );
        do_settings_sections( 'social_feed' );
        submit_button();
        echo '</form>';
    }


    /**
     * Render input fields foreach registered setting
     * @param $opt
     */
    function render_settings_fields($opt){
        switch ($opt[2]){
            case 'checkbox':
                echo '<input  name="'.$opt[0].'" id="'.$opt[0].'" type="checkbox" value="1" class="code" '.checked( 1, get_option( $opt[0] ), false ).'/>';
                break;
            default:
                echo '<input class="regular-text code" name="'.$opt[0].'" id="'.$opt[0].'" type="text" class="code"  value="'.get_option($opt[0]).'" />';
                break;
        }
    }


}

