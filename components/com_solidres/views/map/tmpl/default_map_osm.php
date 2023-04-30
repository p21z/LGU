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
 * /templates/TEMPLATENAME/html/com_solidres/map/default_map_osm.php
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
/** @var Joomla\CMS\WebAsset\WebAssetManager $wa */
$wa = Factory::getApplication()->getDocument()->getWebAssetManager();
$wa->useStyle('com_solidres.leaflet-css');
$wa->useScript('com_solidres.leaflet-js');

?>
<div id="sr-osm-map" style="width: 100vw; height: 100vh"></div>
<script>
	window.addEventListener('load', function () {
        const lat = parseFloat('<?php echo $this->info->lat ?>') || 0;
        const lng = parseFloat('<?php echo $this->info->lng ?>') || 0;
        const map = L.map('sr-osm-map', { zoom: 15, center: [lat, lng] });
        map.addLayer(new L.TileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png'));
        const iconUrl = '<?php echo SRURI_MEDIA . '/assets/images/icon-hotel-' . $this->info->rating . '.png' ?>';
        const popup = '<h4><?php echo $this->info->name ?></h4>'
            + <?php echo json_encode($this->info->description) ?>;
            + '<ul><li><?php echo $this->info->address_1 . ' ' . $this->info->city ?></li>'
			+ '<li><?php echo $this->info->phone ?></li>'
            + '<li><?php echo $this->info->email ?></li>'
            + '<li><?php echo $this->info->website ?></li></ul>';
        L.marker([lat, lng], { icon: L.icon({ iconUrl }) })
            .addTo(map)
            .bindPopup(popup)
            .openPopup();
	});
</script>
