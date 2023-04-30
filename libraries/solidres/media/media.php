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

defined('_JEXEC') or die;

/**
 * Media handler class
 *
 * @package       Solidres
 * @subpackage    Media
 */
class SRMedia
{
	/**
	 * The database object
	 *
	 * @var object
	 */
	protected $_dbo = null;

	public function __construct()
	{
		$this->_dbo = JFactory::getDbo();
	}

	/**
	 * Get file mime type
	 *
	 * @param string $filename The file name
	 *
	 * @return string The MIME type
	 */
	public function getMime($filename)
	{
		require_once SRPATH_LIBRARY . '/media/getid3/getid3.php';

		// Initialize getID3 engine
		$getID3 = new getID3;

		$determinedMimeType = '';
		if ($fp = fopen($filename, 'rb'))
		{
			$getID3->openfile($filename);
			if (empty($getID3->info['error']))
			{

				// ID3v2 is the only tag format that might be prepended in front of files, and it's non-trivial to skip, easier just to parse it and know where to skip to
				getid3_lib::IncludeDependency(SRPATH_LIBRARY . '/media/getid3/module.tag.id3v2.php', __FILE__, true);
				$getid3_id3v2 = new getid3_id3v2($getID3);
				$getid3_id3v2->Analyze();

				fseek($fp, $getID3->info['avdataoffset'], SEEK_SET);
				$formattest = fread($fp, 16);  // 16 bytes is sufficient for any format except ISO CD-image
				fclose($fp);

				$DeterminedFormatInfo = $getID3->GetFileFormat($formattest);
				$determinedMimeType   = $DeterminedFormatInfo['mime_type'];

			}
		}

		return $determinedMimeType;
	}

	/**
	 * Check a file if it is a video or not
	 *
	 * @param string $mimeType
	 */
	public function isVideo($mimeType)
	{

	}

	/**
	 * Check a file if it is a document type or not
	 *
	 * @param    string $mimeType The MIME type
	 *
	 * @return    boolean
	 */
	public function isDocument($mimeType)
	{
		// TODO: get these mime type from component's configuration
		$validMime = array(
			'application/msword',
			'application/excel',
			'application/pdf',
			'application/powerpoint',
			'text/plain'
		);

		if (in_array($mimeType, $validMime))
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	/**
	 * Check a file if it is an image or not
	 *
	 * @param    string $mimeType The MIME type
	 *
	 * @return    boolean
	 */
	public function isImage($mimeType)
	{
		// TODO: get these mime type from component's configuration
		$validMime = array(
			'image/jpeg',
			'image/gif',
			'image/png',
			'image/bmp'
		);

		if (in_array($mimeType, $validMime))
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	/**
	 * Get the media url by sizes
	 *
	 * @param $id   int The identifier, it could be media name/value
	 * @param $size array|string    The size type or an array of width and height
	 *
	 * @return string The media url
	 */
	public function getMediaUrl($id, $size = 'full')
	{
		$solidresParams = JComponentHelper::getParams('com_solidres');
		$mediaNameParts = explode('.', $id);
		$assetSizes     = array(
			'asset_small'     => $solidresParams->get('asset_thumb_small', '75x75'),
			'asset_medium'    => $solidresParams->get('asset_thumb_medium', '300x250'),
			'asset_large'     => $solidresParams->get('asset_thumb_large', '875x350'),
			'roomtype_small'  => $solidresParams->get('roomtype_thumb_small', '75x75'),
			'roomtype_medium' => $solidresParams->get('roomtype_thumb_medium', '300x250'),
			'roomtype_large'  => $solidresParams->get('roomtype_thumb_large', '875x350'),
		);

		$url      = SRURI_MEDIA . '/assets/images/system';
		$thumbDir = SRPATH_MEDIA_IMAGE_SYSTEM . '/thumbnails';
		if (is_string($size))
		{
			if ('full' == $size)
			{
				$url .= "/$id";
			}
			else
			{
				$mediaFileName = $mediaNameParts[0] . '_' . trim($assetSizes[$size]) . '.' . $mediaNameParts[1];
				if (JFile::exists($thumbDir . '/' . $mediaFileName))
				{
					$url .= '/thumbnails/' . $mediaFileName;
				}
				else // Find the legacy thumbnails in sub folders 1 and 2
				{
					if ('roomtype_small' == $size || 'asset_small' == $size)
					{
						$url .= '/thumbnails/2/' . $id;
					}
					elseif ('asset_medium' == $size || 'roomtype_medium' == $size || 'asset_large' == $size || 'roomtype_large' == $size)
					{
						$url .= '/thumbnails/1/' . $id;
					}
				}
			}
		}
		elseif (is_array($size))
		{
			$url .= '/thumbnails/' . $mediaNameParts[0] . '_' . implode('x', $size) . '.' . $mediaNameParts[1];
		}

		return $url;
	}
}