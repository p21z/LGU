/*------------------------------------------------------------------------
 Solidres - Hotel booking extension for Joomla
 ------------------------------------------------------------------------
 @Author    Solidres Team
 @Website   https://www.solidres.com
 @copyright Copyright (C) 2013 - 2021 Solidres. All Rights Reserved.
 @License   GNU General Public License version 3, or later
 ------------------------------------------------------------------------*/

if (typeof(Solidres) === 'undefined') {
    var Solidres = {};
}

Solidres.context = 'frontend';

Solidres.setCurrency = function(id) {
    Solidres.jQuery.ajax({
        type: 'POST',
        url: window.location.pathname,
        data: 'option=com_solidres&format=json&task=currency.setId&id='+parseInt(id),
        success: function(msg) {
            location.reload();
        }
    });
};

function isAtLeastOnRoomTypeSelected() {
    var numberRoomTypeSelected = 0;
    Solidres.jQuery(".room-form").each(function () {
        if (Solidres.jQuery(this).children().length > 0) {
            numberRoomTypeSelected++;
            return;
        }
    });

    if (numberRoomTypeSelected > 0) {
        Solidres.jQuery('#sr-reservation-form-room button[type="submit"]').removeAttr('disabled');
    } else {
        Solidres.jQuery('#sr-reservation-form-room button[type="submit"]').attr('disabled', 'disabled');
    }
};

Solidres.jQuery(function($) {
    if (document.getElementById('sr-reservation-form-room')) {
        $('#sr-reservation-form-room').validate();
    }

    if (document.getElementById("sr-checkavailability-form")) {
        $("#sr-checkavailability-form").validate();
    }

	$(".roomtype-quantity-selection").change(function() {
		isAtLeastOnRoomTypeSelected();
	});

    if (document.getElementById("sr-availability-form")) {
        $("#sr-availability-form").validate();
    }

	$('.coupon').on('click', '#apply-coupon', function () {
        $.ajax({
            type: 'POST',
            url: window.location.pathname,
            data: 'option=com_solidres&format=json&task=coupon.applyCoupon&coupon_code=' + $('#coupon_code').val() + '&raid=' + $('input[name="id"]').val(),
            success: function(response) {
                if (response.status) {
                    location.reload();
                }
            },
            dataType: 'JSON'
        });
    });

    $('#sr-remove-coupon').click(function(e) {
        e.preventDefault();
        $.ajax({
            type: 'POST',
            url: window.location.pathname,
            data: 'option=com_solidres&format=json&task=reservation.removeCoupon&id=' + $(this).data('couponid'),
            success: function(response) {
                if (response.status) {
                    location.reload();
                } else {
                    alert(Joomla.JText._('SR_CAN_NOT_REMOVE_COUPON'));
                }
            },
            dataType: 'JSON'
        });
    });

    $('button.load-calendar').click(function() {
        var self = $(this);
        var id = self.data('roomtypeid');
		var target = $('#availability-calendar-' + id);

		self.empty().html('<i class="fa fa-calendar"></i> ' + Joomla.JText._('SR_PROCESSING'));
		self.attr('disabled', 'disabled');

		if (target.children().length == 0) {
			$.ajax({
				url : Joomla.getOptions('system.paths').base + '/index.php?option=com_solidres&task=reservationasset.getAvailabilityCalendar&id=' + id,
				success : function(html) {
					self.removeAttr('disabled');
					if (html.length > 0) {
						target.show().html(html);
						self.empty().html('<i class="fa fa-calendar"></i> ' + Joomla.JText._('SR_AVAILABILITY_CALENDAR_CLOSE'))
					}
				}
			});
		} else {
			target.empty().hide();
			self.empty().html('<i class="fa fa-calendar"></i> ' + Joomla.JText._('SR_AVAILABILITY_CALENDAR_VIEW'));
			self.removeAttr('disabled');
		}

        // Hide More Info section to make it easier to read in small screen
        if ($('#more_desc_' + id).is(':visible')) {
            $('#more_desc_' + id).hide();
            self.parent().find('.toggle_more_desc').empty().html('<i class="fa fa-eye-slash"></i> ' + Joomla.JText._('SR_SHOW_MORE_INFO'));
        }
    });

    function loadRoomForm(self) {
        var rtid = self.data('rtid');
        var raid = self.data('raid');
		var tariffid = self.data('tariffid');
		var adjoininglayer = self.data('adjoininglayer');

        $.ajax({
            type: 'GET',
            url: Joomla.getOptions('system.paths').base + '/index.php?option=com_solidres&task=reservationasset.getRoomTypeForm',
            data: {rtid: rtid, raid: raid, tariffid: tariffid, quantity: self.val() > 0 ? self.val() : 1, adjoininglayer: adjoininglayer},
            success: function(data) {
                self.parent().find('.processing').css({'display': 'none'});
                $('#room-form-' + rtid + '-' + tariffid).empty().show().html(data).find('.popover_payment_methods, .hasPopover').webuiPopover({
                    "trigger": "hover",
                    "placement": "auto-bottom"
                });
                $('.sr-reservation-form').validate();
				var updateChildAgeDropdown = false; // trigger change at this time will update the child age form too, we dont want that!
                $('#solidres .room #room-form-' + rtid + '-' + tariffid + ' .trigger_tariff_calculating').trigger('change', [updateChildAgeDropdown]);
                isAtLeastOnRoomTypeSelected();
                $('#solidres .room #room-form-' + rtid + '-' + tariffid + ' .extras_row_roomtypeform input:checkbox').trigger('change');
            }
        });
    }

    // In case the page is reloaded, we have to reload the previous submitted room type selection form
    $('.roomtype-quantity-selection').each(function() {
        var self = $(this);
        if ( self.val() > 0) {
            self.parent().find('.processing').css({'display': 'block'});
			$('#selected_tariff_' + self.data('rtid') + '_' + self.data('tariffid')).removeAttr("disabled");
            loadRoomForm(self);
        }
    });

    $('.roomtype-quantity-selection').change(function() {
        var self = $(this);
		var tariffid = self.data('tariffid');
		var rtid = self.data('rtid');
		var totalRoomsLeft = self.data('totalroomsleft');
        var isPrivate = self.data('isprivate');
		var currentQuantity = parseInt(self.val());
		var currentSelectedRoomTypeRooms = 0;
		var totalSelectableRooms = 0;
        if ( currentQuantity > 0) {
			self.parent().find('.processing').css({'display': 'block'});
			$('#selected_tariff_' + rtid + '_' + tariffid).removeAttr("disabled");
            loadRoomForm(self);
            // In a room type, either booking full room type or per room is allowed at the same time
            $('#tariff-holder-' + rtid + ' .exclusive-hidden').prop('disabled', true);
        } else {
            $('#room-form-' + rtid + '-' + tariffid).empty().hide();
			$('input[name="jform[selected_tariffs][' + rtid + ']"]').attr("disabled", "disabled");
			$('#selected_tariff_' + rtid + '_' + tariffid).attr("disabled", "disabled");
            isAtLeastOnRoomTypeSelected();
        }

		$('.quantity_' + rtid).each(function() {
			var s = $(this);
			var val = parseInt(s.val());
			if (val > 0) {
                currentSelectedRoomTypeRooms += val;
            }
		});

		totalSelectableRooms = totalRoomsLeft - currentSelectedRoomTypeRooms;

        $('.quantity_' + rtid).each(function () {
            var s = $(this);
            var val = parseInt(s.val());
            var from, to = 0;
            var qMin = s.data('qmin');
            var qMax = s.data('qmax');

            if (qMin > 0 && qMax > 0) {
                if (totalSelectableRooms >= qMax) {
                    from = qMin;
                    to = qMax;
                    enableOptionsRange(s, from, to);
                } else if (totalSelectableRooms < qMax && totalSelectableRooms >= qMin) {
                    from = qMin;

                    if (val > 0) {
                        if (val + totalSelectableRooms > qMax) {
                            to = qMax;
                        } else {
                            to = val + totalSelectableRooms;
                        }
                    } else {
                        to = totalSelectableRooms;
                    }

                    enableOptionsRange(s, from, to);
                } else {
                    if (val > 0) {
                        from = qMin;
                        if (val + totalSelectableRooms > qMax) {
                            to = qMax;
                        } else {
                            to = val + totalSelectableRooms;
                        }

                        enableOptionsRange(s, from, to);
                    } else {
                        if (totalSelectableRooms < qMin) {
                            from = val;
                        } else {
                            from = val + totalSelectableRooms;
                        }

                        disableOptions(s, from);
                    }
                }
            } else {
                from = val + totalSelectableRooms;
                disableOptions(s, from);
            }
        });

		var messageWrapper = $('#num_rooms_available_msg_' + rtid);
		if (totalSelectableRooms > 0 && totalSelectableRooms < totalRoomsLeft) {
            messageWrapper.empty().text(Joomla.JText._('SR_ONLY_' + totalSelectableRooms + '_LEFT' + (!isPrivate ? '_BED' : '')));
		} else if (totalSelectableRooms == 0) {
            messageWrapper.empty();
		} else {
            messageWrapper.empty().text($('#num_rooms_available_msg_' + rtid).data('original-text'));
		}
    });

    $('.roomtype-reserve').click(function() {
        var self = $(this);
        var tariffid = self.data('tariffid');
        var rtid = self.data('rtid');
        if ( $("#room-form-" + rtid + "-" + tariffid).children().length == 0) {
            $('#room_type_row_' + rtid + ' .room-form').empty().hide();
            self.siblings('.processing').css({'display': 'block'});
            $('#selected_tariff_' + rtid + '_' + tariffid).removeAttr("disabled");
            loadRoomForm(self);
        } else {
            $('#room-form-' + rtid + '-' + tariffid).empty().hide();
            $('input[name="jform[selected_tariffs][' + rtid + ']"]').attr("disabled", "disabled");
            $('#selected_tariff_' + rtid + '_' + tariffid).attr("disabled", "disabled");
        }
        isAtLeastOnRoomTypeSelected();
    });

    function disableOptions(selectEl, from) {
        $('option', selectEl).each(function() {
            var val = parseInt($(this).attr('value'));
            if (val > from) {
                $(this).attr('disabled', 'disabled');
            } else {
                $(this).removeAttr('disabled');
            }
        });
    }

    function enableOptionsRange(selectEl, from, to) {
        $('option', selectEl).each(function() {
            var val = parseInt($(this).attr('value'));
            if (val >= from && val <= to) {
                $(this).removeAttr('disabled');
            } else {
                $(this).attr('disabled', 'disabled');
            }

            if (val == 0) { // The placeholder should be selectable
                $(this).removeAttr('disabled');
            }
        });
    }

    $('.guestinfo').on('click', 'input:checkbox', function() {
        var self = $(this);
        if (self.is(':checked')) {
            $('.' + self.data('target') ).removeAttr('disabled');
        } else {
            $('.' + self.data('target') ).attr('disabled', 'disabled');
        }
    });

    $('.room-form').on('click', 'input:checkbox', function() {
        var self = $(this);
        if (self.is(':checked')) {
            $('.' + self.data('target') ).removeAttr('disabled');
        } else {
            $('.' + self.data('target') ).attr('disabled', 'disabled');
        }
    });

	$('.trigger_checkinoutform').click(function() {
		var self = $(this);
		var tariffId = self.data('tariffid');
		var roomtypeId = self.data('roomtypeid');
		var oldLabel = self.text();

		if (tariffId != '') {
			$('.checkinoutform').empty();
			self.text(Joomla.JText._('SR_PROCESSING'));
			$.ajax({
				type: 'GET',
				data: {Itemid : self.data('itemid'), id: self.data('assetid'), roomtype_id: roomtypeId, tariff_id : tariffId},
				url: Joomla.getOptions('system.paths').base + '/index.php?option=com_solidres&task=reservationasset.getCheckInOutForm',
				success: function(data) {
					$('.checkinoutform').empty();
					$('#checkinoutform-' + roomtypeId + '-' + tariffId).show().empty().html(data);
					$('#room-form-' + roomtypeId + '-' + tariffId).empty();
					self.text(oldLabel);
				}
			});
		}
	});

	$('#solidres').on('click', '.searchbtn', function() {
		var tariffid = $(this).data('tariffid');
		var roomtypeid = $(this).data('roomtypeid');
		var formComponent = $('#sr-checkavailability-form-component');
        if (Solidres.options.get('AutoScroll') == 1) {
            var target = '#tariff-box-' + roomtypeid + '-' + tariffid;
            if (Solidres.options.get('AutoScrollTariff') == 0) {
                target = '#srt_' + roomtypeid;
            }
            formComponent.attr('action', formComponent.attr('action') + target);
        }
        formComponent.find('input[name=checkin]').val($('#tariff-box-' + roomtypeid + '-' + tariffid + ' input[name="checkin"]').val());
        formComponent.find('input[name=checkout]').val($('#tariff-box-' + roomtypeid + '-' + tariffid + ' input[name="checkout"]').val());
        formComponent.find('input[name=ts]').val($('input[name=fts]').val());
        formComponent.submit();
	});

	$('.toggle_more_desc').click(function() {
		var self = $(this);
		$('#more_desc_' + self.data('target')).toggle();
		if ($('#more_desc_' + self.data('target')).is(':visible')) {
			self.empty().html('<i class="fa fa-eye"></i> ' + Joomla.JText._('SR_HIDE_MORE_INFO'));
		} else {
			self.empty().html('<i class="fa fa-eye-slash"></i> ' + Joomla.JText._('SR_SHOW_MORE_INFO'));
		}

	});

	$('#solidres').on('click', '.checkin_roomtype', function() {
		if (!$(this).hasClass("disabledCalendar")) {
			$('.checkin_datepicker_inline').slideToggle();
		}
	});

	$('#solidres').on('click', '.checkout_roomtype', function() {
		if (!$(this).hasClass("disabledCalendar")) {
			$('.checkout_datepicker_inline').slideToggle();
		}
	});

	$('#solidres').on('click', '#register_an_account_form', function() {
		var self = $(this);
		self.parents('form').find('button[data-step="guestinfo"]').prop('disabled', false);

		if (self.is(':checked')) {
			$('.' + self.attr('id') ).show();
		} else {
			$('.' + self.attr('id') ).hide();
		}
	});

	$('.toggle-tariffs').click(function() {
		var self = $(this);
		var roomtypeid = self.data('roomtypeid');
		var target = $('#tariff-holder-' + roomtypeid);

		// Hide More Info and Availability Calendar sections
        if ($('#more_desc_' + roomtypeid).is(':visible')) {
            $('#more_desc_' + roomtypeid).hide();
            self.parent().find('.toggle_more_desc').empty().html('<i class="fa fa-eye-slash"></i> ' + Joomla.JText._('SR_SHOW_MORE_INFO'));
        }

        if ($('#availability-calendar-' + roomtypeid).is(':visible')) {
            $('#availability-calendar-' + roomtypeid).empty().hide();
            self.parent().find('.load-calendar').empty().html('<i class="fa fa-calendar"></i> ' + Joomla.JText._('SR_AVAILABILITY_CALENDAR_VIEW'));
        }

		target.toggle();
		if (target.is(":hidden")) {
			self.html('<i class="fa fa-expand"></i> ' + Joomla.JText._('SR_SHOW_TARIFFS'));
		} else {
			self.html('<i class="fa fa-compress"></i> ' + Joomla.JText._('SR_HIDE_TARIFFS'));
		}
	});

	var hash = location.hash;

	if (hash.indexOf('tariff-box') > -1) {
		var $el = $(hash),
			x = 1500,
			originalColor = $el.css("backgroundColor"),
			targetColor = $el.data("targetcolor");

		$el.css("backgroundColor", "#" + targetColor);
		setTimeout(function(){
			$el.css("backgroundColor", originalColor);
		}, x);
	}

    $('.filter_checkin_checkout').datepicker({
        numberOfMonths : 1,
        showButtonPanel : true,
        dateFormat : 'dd-mm-yy',
        firstDay: 1
    });

    $('html').click(function(e) {
        if (!$(e.target).hasClass('datefield')
            &&
            !$(e.target).parent().hasClass('datefield')
            &&
            $(e.target).closest('div.ui-datepicker').length == 0
            &&
            $(e.target).closest('a.ui-datepicker-prev').length == 0
            &&
            $(e.target).closest('a.ui-datepicker-next').length == 0
            &&
            $(e.target).closest('div.ui-datepicker-buttonpane').length == 0
        ) {
            $(".datepicker_inline").hide();
        }
    });

    $("#show-other-roomtypes").click(function() {
        $('.room_type_row').each(function() {
            if (!$(this).hasClass('prioritizing')) {
                $(this).toggle();
            }
        });
        $('.prioritizing-roomtype-notice').hide();
    });

    $('.guestinfo').on('click', 'button[data-step="guestinfo"]', function (e) {
        var pc = $('#privacy-consent');
        var btn = $(this);

        if (pc.length
            && $('#register_an_account_form').is(':checked')
            && !pc.is(':checked')
        ) {
            e.preventDefault();
            e.stopPropagation();
            pc.parent('label').addClass('error');
            $('html, body').animate({
               scrollTop:  $('#register_an_account_form').offset().top
            }, 400);
            btn.prop('disabled', true);

            return false;
        }

        btn.prop('disabled', false);
        pc.parent('label').removeClass('error');
    });

    $('.guestinfo').on('change', '#privacy-consent', function () {
        $(this).parents('form').find('button[data-step="guestinfo"]').prop('disabled', !$(this).is(':checked'));
    });

    if ($('.rooms-rates-summary.module').length) {
        var summaryWrapper = $('.rooms-rates-summary.module');
        var solidresWrapper = $('#solidres');
        var scrollData = {};
        scrollData.pos = summaryWrapper.offset().top;
        scrollData.pos_bottom = 1000;
        if (solidresWrapper) {
            scrollData.pos_bottom = solidresWrapper.outerHeight();
        }

        if (summarySidebarId) {
            var summaryWrapperParent = summaryWrapper.parents(summarySidebarId);
            scrollData.width = summaryWrapperParent.width() - parseInt(summaryWrapper.css('padding-left')) - parseInt((summaryWrapper.css('padding-right')));
        } else {
            var summaryWrapperParent = summaryWrapper.parent();
            scrollData.width = summaryWrapperParent.width() - parseInt(summaryWrapper.css('padding-left')) - parseInt((summaryWrapper.css('padding-right')));
        }

        function stickyScrollHandler() {
            if ($(window).scrollTop() >= scrollData.pos && $(window).scrollTop() < scrollData.pos_bottom) {
                summaryWrapperParent.addClass('rooms-rates-summary-sticky');
                summaryWrapperParent.css({'width': scrollData.width});
            } else {
                summaryWrapperParent.removeClass("rooms-rates-summary-sticky");
            }
        }

        $(window).scroll(scrollData, stickyScrollHandler);

        window.addEventListener('resize', function(event){
            var summaryWrapper = $('.rooms-rates-summary.module');
            var scrollData = {};
            scrollData.pos = summaryWrapper.offset().top;
            scrollData.width = summaryWrapperParent.width() - parseInt(summaryWrapper.css('padding-left')) - parseInt((summaryWrapper.css('padding-right')));
            $(window).off('scroll', stickyScrollHandler);
            $(window).scroll(scrollData, stickyScrollHandler);
        });
    }

    $('.booking-summary a.open-overlay').click(function() {
        summaryWrapperParent.removeClass('rooms-rates-summary-sticky');
        summaryWrapper.addClass('sr-overlay');
        $('.sr-close-overlay').show();
    });

    if ($('.sr-apartment-form').length) {
        var bookFormWrapper = $('.sr-apartment-form');
        var solidresWrapper = $('#solidres');
        var scrollData = {};
        var galleryWrapper = $('.sr-gallery');
        scrollData.pos = bookFormWrapper.offset().top;
        scrollData.pos_bottom = 1000;
        if (solidresWrapper) {
            scrollData.pos_bottom = solidresWrapper.outerHeight();
        }

        if (galleryWrapper.length) {
            scrollData.pos += galleryWrapper.offset().top;
        }

        var bookFormWrapperParent = bookFormWrapper.parents('.sr-apartment-aside');
        scrollData.width = bookFormWrapperParent.width() - parseInt(bookFormWrapper.css('padding-left')) - parseInt((bookFormWrapper.css('padding-right')));

        function stickyScrollHandler() {
            if ($(window).scrollTop() >= scrollData.pos && $(window).scrollTop() < scrollData.pos_bottom) {
                bookFormWrapperParent.addClass('rooms-rates-summary-sticky');
                bookFormWrapperParent.css({'width': scrollData.width});
            } else {
                bookFormWrapperParent.removeClass("rooms-rates-summary-sticky");
            }
        }

        $(window).scroll(scrollData, stickyScrollHandler);

        window.addEventListener('resize', function(event){
            var bookFormWrapper = $('.sr-apartment-form');
            var scrollData = {};
            scrollData.pos = bookFormWrapper.offset().top;
            scrollData.width = bookFormWrapperParent.width() - parseInt(bookFormWrapper.css('padding-left')) - parseInt((bookFormWrapper.css('padding-right')));
            $(window).off('scroll', stickyScrollHandler);
            $(window).scroll(scrollData, stickyScrollHandler);
        });
    }

    $('.booking-summary a.open-overlay-apartment').click(function() {
        bookFormWrapperParent.removeClass('rooms-rates-summary-sticky');
        bookFormWrapper.addClass('sr-overlay');
        $('.sr-close-overlay').show();
        $('.sr-apartment-form h3').show();
    });

    $(document).on('click', '.sr-close-overlay', function () {
        if (summaryWrapper) {
            summaryWrapper.removeClass('sr-overlay');
            $(this).hide();
        }

        if (bookFormWrapper) {
            bookFormWrapper.removeClass('sr-overlay');
            $(this).hide();
        }
    });

    $(document).on('click', '.summary_edit_room', function() {
        var target = $(this).data('target');

        $('.reservation-navigate-back').trigger('click', ['room']);

        if ($('#tariff-box-' + target).length > 0) {
            $('html, body').animate({
                scrollTop: $('#tariff-box-' + target).offset().top
            }, 700);
        }
    });

    $(document).on('click', '.summary_remove_room', function() {
        var target = $(this).data('target');
    });

    $('.apartment-rateplan-picker').change(function() {
        var self = $(this);
        var tariffId = self.val();
        var roomtypeId = Joomla.getOptions('com_solidres.apartment').roomTypeId;

        if (tariffId != '') {
            var apartmentFormHolder = $('.apartment-form-holder');
            apartmentFormHolder.empty();
            $.ajax({
                type: 'GET',
                data: {
                    Itemid : Joomla.getOptions('com_solidres.apartment').itemId,
                    id: Joomla.getOptions('com_solidres.apartment').propertyId,
                    roomtype_id: roomtypeId,
                    tariff_id : tariffId,
                    type: 1
                },
                url: Joomla.getOptions('system.paths').base + '/index.php?option=com_solidres&task=reservationasset.getCheckInOutForm',
                success: function(data) {
                    apartmentFormHolder.empty().html(data);
                    btn = apartmentFormHolder.find('button[type="button"]');
                    btn.attr('type', 'submit');
                    btn.removeAttr('disabled', 'disabled');
                }
            });
        }
    });

    $('.apartment-rateplan-picker').trigger('change');
});
