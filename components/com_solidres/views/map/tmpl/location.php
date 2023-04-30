<?php
/**
 ------------------------------------------------------------------------
 SOLIDRES - Accommodation booking extension for Joomla
 ------------------------------------------------------------------------
 * @author    Solidres Team <contact@solidres.com>
 * @website   https://www.solidres.com
 * @copyright Copyright (C) 2013 Solidres. All Rights Reserved.
 * @license   GNU General Public License version 3, or later
 ------------------------------------------------------------------------
 */

/*
 * This layout file can be overridden by copying to:
 *
 * /templates/TEMPLATENAME/html/com_solidres/map/location.php
 *
 * However, occasionally we will need to update template/layout related files and it is the template developers'
 * responsibility to update the overridden files (if any) to maintain full compatibility with Solidres.
 *
 * We do not provide support if any of the overridden files are out of date and are not compatible with Solidres.
 *
 * @version 2.8.0
 */

defined('_JEXEC') or die;

$doc             = JFactory::getDocument();
$solidresParams  = JComponentHelper::getParams('com_solidres');
$googleMapApiKey = $solidresParams->get('google_map_api_key', '');
$doc->addScript('//maps.google.com/maps/api/js' . (!empty($googleMapApiKey) ? '?key=' . $googleMapApiKey : ''));

?>

<div id="inline_location_map"></div>

<?php
$doc->addScriptDeclaration("
    Solidres.jQuery(function ($) {
        var map;
        var marker;
        var markers = [];
        var infowindow = new google.maps.InfoWindow({
            maxWidth: 260
        });

        $.ajax({
            url: Joomla.getOptions('system.paths').base + '/index.php?option=com_solidres&task=map.getMarkers&format=json&location={$this->location}',
            data: {},
            dataType: 'json',
            success: function (data) {
                map = new google.maps.Map(document.getElementById('inline_location_map'), {
                    zoom: 10,
                    center: new google.maps.LatLng(-37.92, 151.25),
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                });

                for (var i = 0; i < data.length; i++) {
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(data[i]['lat'], data[i]['lng']),
                        map: map,
                        icon: '" . SRURI_MEDIA . "/assets/images/icon-hotel-' + data[i]['rating'] + '.png'
                    });

                    markers.push(marker);

                    google.maps.event.addListener(marker, 'click', (function (marker, i) {
                        return function () {
                            infowindow.setContent('<h4><a href=\"' + data[i]['link'] + '\">' + data[i]['name'] + '</a></h4>' +
                                '<p>' + data[i]['address_1'] + '</p>');
                            infowindow.open(map, marker);
                        }
                    })(marker, i));
                }

                var bounds = new google.maps.LatLngBounds();
                $.each(markers, function (index, marker) {
                    bounds.extend(marker.position);
                });
                map.fitBounds(bounds);
            }
        });
    });
");