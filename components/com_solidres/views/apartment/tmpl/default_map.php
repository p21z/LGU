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
 * /templates/TEMPLATENAME/html/com_solidres/apartment/default_map.php
 *
 * However, occasionally we will need to update template/layout related files and it is the template developers'
 * responsibility to update the overridden files (if any) to maintain full compatibility with Solidres.
 *
 * We do not provide support if any of the overridden files are out of date and are not compatible with Solidres.
 *
 * @version 2.12.0
 */

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\HTML\HTMLHelper;
$isOSM     = SRUtilities::getMapProvider() === 'OSM';
$hasLatLng = !empty($this->property->lat) && !empty($this->property->lng);

if ($hasLatLng) :

    if ($isOSM)
    {
	    /** @var Joomla\CMS\WebAsset\WebAssetManager $wa */
	    $wa = Factory::getApplication()->getDocument()->getWebAssetManager();
	    $wa->useStyle('com_solidres.leaflet-css');
	    $wa->useScript('com_solidres.leaflet-js');
    }
    else
    {
	$googleMapApiKey = $this->config->get('google_map_api_key', '');
	HTMLHelper::_('script', '//maps.google.com/maps/api/js' . (!empty($googleMapApiKey) ? '?key=' . $googleMapApiKey : ''));
    }

	?>
	<h2 class="leader"><?php echo Text::_('SR_LOCATION'); ?></h2>
	<div id="sr-apartment-map"></div>
    <?php if($isOSM): ?>
    <script>
        window.addEventListener('load', function () {
            const lat = parseFloat('<?php echo $this->property->lat ?>') || 0;
            const lng = parseFloat('<?php echo $this->property->lng ?>') || 0;
            const map = L.map('sr-apartment-map', { zoom: 15, center: [lat, lng] });
            map.addLayer(new L.TileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png'));
            const iconUrl = '<?php echo SRURI_MEDIA . '/assets/images/icon-hotel-' . $this->property->rating . '.png' ?>';
            const popup = '<h4><?php echo $this->property->name ?></h4>'
                + <?php echo json_encode($this->property->description) ?>;
            + '<ul><li><?php echo $this->property->address_1 . ' ' . $this->property->city ?></li>'
            + '<li><?php echo $this->property->phone ?></li>'
            + '<li><?php echo $this->property->email ?></li>'
            + '<li><?php echo $this->property->website ?></li></ul>';
            L.marker([lat, lng], { icon: L.icon({ iconUrl }) })
                .addTo(map)
                .bindPopup(popup)
                .openPopup();
        });
    </script>
    <?php else: ?>
	<script>
        Solidres.jQuery(function () {
            var
                latlng = new google.maps.LatLng('<?php echo $this->property->lat; ?>', '<?php echo $this->property->lng; ?>'),
                options = {
                    zoom: 15,
                    center: latlng,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                },
                map = new google.maps.Map(document.getElementById('sr-apartment-map'), options),
                image = new google.maps.MarkerImage('<?php echo SRURI_MEDIA; ?>/assets/images/icon-hotel-<?php echo $this->property->rating; ?>.png',
                    new google.maps.Size(32, 37),
                    new google.maps.Point(0, 0),
                    new google.maps.Point(0, 32)
                ),
                marker = new google.maps.Marker({
                    map: map,
                    position: latlng,
                    icon: image,
                }),
                windowContent = '<h4><?php echo $this->property->name; ?></h4>' +
					<?php echo json_encode($this->property->description) ?>
                    +'<ul><li><?php echo $this->property->address_1; ?></li>'
                    + '<li><?php echo $this->property->city; ?></li>'
                    + '<li><?php echo $this->property->phone; ?></li>'
                    + '<li><?php echo $this->property->email; ?></li></ul>',
                infoWindow = new google.maps.InfoWindow({
                    content: windowContent,
                    maxWidth: 350,
                });

            google.maps.event.addListener(marker, 'click', function () {
                infoWindow.open(map, marker);
            });
        });
	</script>
    <?php endif ?>
<?php endif; ?>
