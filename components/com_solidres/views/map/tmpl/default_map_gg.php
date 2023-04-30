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
 * /templates/TEMPLATENAME/html/com_solidres/map/default_map_gg.php
 *
 * However, occasionally we will need to update template/layout related files and it is the template developers'
 * responsibility to update the overridden files (if any) to maintain full compatibility with Solidres.
 *
 * We do not provide support if any of the overridden files are out of date and are not compatible with Solidres.
 *
 * @version 2.13.3
 */


defined('_JEXEC') or die;

use Joomla\CMS\Factory;

$doc = Factory::getDocument();
$doc->addScript('//maps.google.com/maps/api/js' . (!empty($this->ggMapApiKey) ? '?key=' . $this->ggMapApiKey : ''));
$doc->addScriptDeclaration('
	var map;
	function initialize() {
		var latlng = new google.maps.LatLng("' . $this->info->lat . '", "' . $this->info->lng . '");
		var options = {
			zoom: 15,
			center: latlng,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		}
		
		var styles = {
            default: null,
            hideFeatures: [
                {
                    featureType: "poi.business",
                    stylers: [{ visibility: "off" }]
                }
            ]
        };
        
		map = new google.maps.Map(document.getElementById("inline_map"), options);
		
		map.setOptions({ styles: styles["hideFeatures"] });

		var image = new google.maps.MarkerImage("' . SRURI_MEDIA . '/assets/images/icon-hotel-' . $this->info->rating . '.png",
            null,
            null,
            null);

		var marker = new google.maps.Marker({
			map: map,
			position: latlng,
			icon: image,
		});

		var windowContent = "<h4>' . $this->info->name . '</h4>" +
			' . json_encode($this->info->description) . ' +
			"<ul>" +
				"<li>' . $this->info->address_1 . "  " . $this->info->city . '</li>" +
				"<li>' . $this->info->phone . '</li>" +
				"<li>' . $this->info->email . '</li>" +
				"<li>' . $this->info->website . '</li>" +
			"</ul>";

		var infowindow = new google.maps.InfoWindow({
			content: windowContent,
			maxWidth: 350
		});

		google.maps.event.addListener(marker, "click", function() {
			infowindow.open(map,marker);
		});
	}

    window.addEventListener("load", initialize);
');


?>

<div id="inline_map"></div>
<style>
    body.contentpane,
    body.component-body,
    div.component-content {
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100%;
    }

    body.contentpane > div:not(#system-message-container) {
        height: 100%;
    }

    html {
        width: 100%;
        height: 100%;
    }
</style>