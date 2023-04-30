/*------------------------------------------------------------------------
 Solidres - Hotel booking extension for Joomla
 ------------------------------------------------------------------------
 @Author    Solidres Team
 @Website   https://www.solidres.com
 @copyright Copyright (C) 2013 Solidres. All Rights Reserved.
 @License   GNU General Public License version 3, or later
 ------------------------------------------------------------------------*/

Solidres.options = {
    data: {},
    'get': function (key, def) {
        return typeof this.data[key.toUpperCase()] !== 'undefined' ? this.data[key.toUpperCase()] : def;
    },
    load: function (object) {
        for (var key in object) {
            this.data[key.toUpperCase()] = object[key];
        }
        return this;
    }
};

Solidres.sprintf = function (str) {
    var counter = 1;
    var args = arguments;

    return str.replace(/%s/g, function () {
        return args[counter++];
    });
};

Solidres.printTable = function (table) {
    nw = window.open('');
    nw.document.write(table.outerHTML);
    nw.print();
    nw.close();
};

function isAtLeastOneRoomSelected() {
    var numberRoomTypeSelected = 0;
    Solidres.jQuery(".reservation_room_select").each(function () {
        var el = Solidres.jQuery(this);
        if (el.is(':checked') && !el.prop('disabled')) {
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

function ajaxProgressMedia(iframe) {
    var $ = Solidres.jQuery;
    if (iframe) {
        var
            targetId = window.parent.Solidres.options.get('targetId'),
            token = window.parent.Solidres.options.get('token'),
            uriBase = window.parent.Solidres.options.get('uriBase'),
            target = window.parent.Solidres.options.get('target'),
            mediaList = $('#item-form', window.parent.document).find('input[name="jform[mediaId][]"]');
    } else {
        var
            targetId = Solidres.options.get('targetId'),
            token = Solidres.options.get('token'),
            uriBase = Solidres.options.get('uriBase'),
            target = Solidres.options.get('target'),
            mediaList = $('#item-form').find('input[name="jform[mediaId][]"]');
    }
    if (mediaList.length && targetId && targetId > 0 && token) {
        var mediaKeys = [];
        mediaList.each(function () {
            mediaKeys.push($(this).val());
        });
        var postData = {
            targetId: targetId,
            mediaKeys: mediaKeys,
            target: target,
        };

        postData[token] = 1;

        $.ajax({
            url: uriBase + 'index.php?option=com_solidres&task=media.ajaxProgressMedia&format=json',
            type: 'post',
            dataType: 'json',
            data: postData,
            success: function (response) {
                console.log(response);
            }
        });
    }
}

var isValidCheckInDate = function (day, allowedCheckinDays) {
    if (allowedCheckinDays.length == 0) {
        return false;
    }

    if (Solidres.jQuery.inArray(day, allowedCheckinDays) > -1) {
        return true;
    } else {
        return false;
    }
};

Solidres.validateCardForm = function (container) {
    var
        $ = Solidres.jQuery,
        form = container.parents('form'),
        paymentElement = container.data('element');

    if (container.hasClass('handled')) {
        return true;
    }

    container.addClass('handled');

    var
        acceptedCards = container.data('acceptedCards') || {all: true},
        cardNumRule = {
            required: true,
            creditcard: true,
            creditcardtypes: acceptedCards,
        },
        cardCVVRule = {
            required: true,
            number: true,
        },
        cardHolderRule = {
            required: true,
            lettersWithSpacesOnly: true,
        },
        expiration = {
            required: true,
            cardExpirationRule: true,
        };

    form.on('change', 'input.payment_method_radio', function (e) {
        e.preventDefault();
        var
            inputName = form.find('[name="jform[' + paymentElement + '][cardHolder]"]'),
            inputNumber = form.find('[name="jform[' + paymentElement + '][cardNumber]"]'),
            inputCvv = form.find('[name="jform[' + paymentElement + '][cardCvv]"]'),
            inputExpiration = form.find('[name="sr_payment_' + paymentElement + '_expiration"]');

        if ($(this).is(':checked') && this.value === paymentElement) {
            form.find('.payment_method_' + paymentElement + '_details').removeClass('nodisplay');
            form.find('.payment_method_' + paymentElement + '_details input').attr('required', true);
            form.find('.payment_method_' + paymentElement + '_details select').attr('required', true);
            inputNumber.length && inputNumber.rules('add', cardNumRule);
            inputCvv.length && inputCvv.rules('add', cardCVVRule);
            inputName.length && inputName.rules('add', cardHolderRule);
            inputExpiration.length && inputExpiration.rules('add', expiration);

        } else {
            form.find('.payment_method_' + paymentElement + '_details').addClass('nodisplay');
            form.find('.payment_method_' + paymentElement + '_details input').removeAttr('required');
            form.find('.payment_method_' + paymentElement + '_details select').removeAttr('required');
            inputNumber.length && inputNumber.rules('remove');
            inputCvv.length && inputCvv.rules('remove');
            inputName.length && inputName.rules('remove');
            inputExpiration.length && inputExpiration.rules('remove');
        }
    });
};

Solidres.jQuery(function ($) {

    if (!$.validator.methods.hasOwnProperty('lettersWithSpacesOnly')) {
        $.validator.addMethod('lettersWithSpacesOnly', function (value, element) {
            return this.optional(element) || /^[a-z\s]+$/i.test(value);
        }, Joomla.JText._('SR_WARN_ONLY_LETTERS_N_SPACES_MSG', 'Letters and spaces only please'));
    }

    if (!$.validator.methods.hasOwnProperty('cardExpirationRule')) {
        $.validator.addMethod('cardExpirationRule', function (value, element) {
            if (!value.match(/^[0-9]{2}\/[0-9]{2}$/g)) {
                return false;
            }

            var
                form = $(element.form),
                date = new Date(),
                expiration = value.split('/'),
                month = parseInt(expiration[0]),
                year = parseInt(date.getFullYear().toString().substring(0, 2) + expiration[1]),
                nowYear = parseInt(date.getFullYear().toString()),
                nowMonth = parseInt(date.getMonth().toString()),
                elementName = $(element).parents('.sr-payment-card-form-container').data('element');

            if (month < 1
                || month > 12
                || year < nowYear
                || (year === nowYear && month < nowMonth + 1)
            ) {
                return false;
            }

            form.find('[name="jform[' + elementName + '][expiryMonth]"]').val(month.toString().length === 1 ? '0' + month : month);
            form.find('[name="jform[' + elementName + '][expiryYear]"]').val(year);

            return true;
        }, Joomla.JText._('SR_WARN_INVALID_EXPIRATION_MSG', 'Your card\'s expiration year is invalid or in the past.'));
    }

    var validateCardForm = function () {
        $('.sr-payment-card-form-container[data-accepted-cards]').each(function () {
            Solidres.validateCardForm($(this));
        });
    };

    validateCardForm();

    $('#solidres').on('click', '.reservation-navigate-back', function (event, pstep) {
        $('.reservation-tab').removeClass('active');
        $('.reservation-single-step-holder').removeClass('nodisplay').addClass('nodisplay');
        var self = $(this);

        if (typeof pstep === 'undefined') {
            var prevstep = self.data('prevstep');
        } else {
            var prevstep = pstep;
        }

        var active = $('.' + prevstep).removeClass('nodisplay');
        active.find('button[type=submit]').removeAttr('disabled');
        $('.reservation-tab').find('span.badge').removeClass('badge-info');
        $('.reservation-tab-' + prevstep).addClass('active').removeClass('complete');
        $('.reservation-tab-' + prevstep + ' span.badge').removeClass('badge-success').addClass('badge-info');

        if ($('.rooms-rates-summary.module').length) {
            var summaryWrapper = $('.rooms-rates-summary.module');
            if (summarySidebarId) {
                var summaryWrapperParent = summaryWrapper.parents(summarySidebarId);
            } else {
                var summaryWrapperParent = summaryWrapper.parent();
            }

            if (prevstep == 'room' || prevstep == 'guestinfo') {
                summaryWrapperParent.show();
            } else {
                summaryWrapperParent.hide();
            }
        }
    });

    $('.confirmation').on('click', '#termsandconditions', function () {
        var self = $(this),
            submitBtn = $('.confirmation').find('button[type=submit]');

        if (self.is(':checked')) {
            submitBtn.removeAttr('disabled');
        } else {
            submitBtn.attr('disabled', 'disabled');
        }
    });

    $('#media-select-all').click(function () {
        $('.media-checkbox').prop('checked', true);
    });

    $('#media-deselect-all').click(function () {
        $('.media-checkbox').prop('checked', false);
    });

    if ($('.media-sortable').length) {
        $('.media-sortable').sortable({
            placeholder: "media-sortable-placeholder",
            update: function (event, ui) {
                ajaxProgressMedia(false);
            }
        });
        $('.media-sortable').disableSelection();
    }

    var loadFormContents = function () {
        var q = $('#medialibraryform #mediasearch');
        var btn = $('#media-toggle');
        $.ajax({
            url: Joomla.getOptions('system.paths').base + '/index.php?option=com_solidres&task=medialist.show&format=json',
            data: {
                start: $('#media-content').data('pageNavStart') ? $('#media-content').data('pageNavStart') : 0,
                limit: 5,
                q: q.val(),
                viewMode: btn.data('viewMode')
            },
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    $('#medialibrary').html($(response.data).find('#medialibrary').html());
                    $('#medialibraryform .pagination').html($(response.data).find('#medialibraryform .pagination').html());
                } else {
                    alert(response.message);
                }
            }
        });
    };

    $('#solidres').on('click', '#media-library-delete', function (e) {
        var form = $('#medialibraryform');
        $.ajax({
            url: Joomla.getOptions('system.paths').base + '/index.php?option=com_solidres&task=media.delete&format=json',
            data: form.serialize(),
            type: 'post',
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    $('#media-lib-wrap').html($(response.data).find('#media-lib-wrap').html())
                    $('#medialibraryform .pagination').html($(response.data).find('#medialibraryform .pagination').html())
                } else {
                    alert(response.success);
                }
            }
        });
    });

    $('#solidres').on('submit', '#medialibraryform', function (e) {
        e.preventDefault();
        loadFormContents();
    });

    $('#solidres').on('click', '#medialibraryform .pagination ul>li>a', function (e) {
        e.preventDefault();
        var start = $(this).attr('data-start');

        if (start) {
            $('#media-content').data('pageNavStart', start);
            $('#medialibraryform .pagination ul>li').removeClass('active');
            $(this).parent().addClass('active');
            loadFormContents();
        } else {
            $('#media-content').data('pageNavStart', 0);
        }
    });

    $('#solidres').on('reset', 'form#medialibraryform', function () {
        setTimeout(loadFormContents, 100)
    });

    $('#solidres').on('click', '#media-library-insert', function (e) {
        e.preventDefault();
        $('#medialibrary input:checked').each(function () {
            if (window.parent !== null) {
                // Only insert if it was not inserted before
                var wrap = $(this).parents('.media-lib-items');
                var media = wrap.hasClass('list')
                    ? $(this).parents('tr:eq(0)').find('.media-file')
                    : $(this).parents('.media-lib-item:eq(0)').find('.media-file');
                var mediaCssID = media.attr('id');
                var mediaName = media.attr('title');
                if ($('#' + mediaCssID, window.parent.document).length == 0) {
                    var a = $('<li>');
                    var b = media.clone();
                    var c = $('<input/>', {
                        'type': 'hidden',
                        'name': 'jform[mediaId][]',
                        'value': mediaCssID.substring(9)
                    });
                    var d = $('<button/>', {
                        'type': 'button',
                        'class': 'btn btn-sm btn-danger btn-remove',
                        'html': '<i class="fa fa-trash"></i>'
                    });
                    $('#media-holder', window.parent.document).append(a.append(b, c, mediaName, $('<p>').append(d)));
                }
            }
        });

        if (window.parent) {
            ajaxProgressMedia(true);
            if (window.parent.Solidres.jQuery('#modal-pictures').length) {
                window.parent.Solidres.jQuery('#modal-pictures').modal('hide');
            } else {
                window.parent.Joomla.Modal.getCurrent().close();
            }
        }
    });

    $(document).on('click', '#media-holder .btn-remove', function () {
        var el = $(this),
            targetId = Solidres.options.get('targetId'),
            target = Solidres.options.get('target'),
            token = Solidres.options.get('token'),
            uriBase = Solidres.options.get('uriBase'),
            postData = {
                targetId: targetId,
                target: target,
                mediaId: el.parent().siblings('input[name="jform[mediaId][]"]').val()
            };
        if (targetId && targetId > 0 && token) {
            postData[token] = 1;
            el.find('>.fa').removeClass('fa-trash').addClass('fa-spin fa-spinner');
            $.ajax({
                url: uriBase + 'index.php?option=com_solidres&task=media.ajaxRemoveMedia&format=json',
                type: 'post',
                dataType: 'json',
                data: postData,
                success: function (response) {
                    if (response.status) {
                        el.parents('li').remove();
                    } else {
                        var message = $('<p class="label label-error">' + response.message + '</label>');
                        el.after(message);
                        window.setTimeout(function () {
                            message.remove();
                        }, 3000);
                    }
                }
            });
        } else {
            el.parents('li').remove();
        }
    });

    $('#solidres .guestinfo').on('change', '.country_select', function () {
        $.ajax({
            url: Joomla.getOptions('system.paths').base + '/index.php?option=com_solidres&format=json&task=states.find&id=' + $(this).val(),
            success: function (html) {
                $('.state_select').empty();
                if (html.length > 0) {
                    $('.state_select').html(html);
                }
            }
        });
    });

    $('#solidres').on('change', '.trigger_tariff_calculating', function (event, updateChildAgeDropdown) {
        var self = $(this);
        var raid = self.data('raid');
        var roomtypeid = self.data('roomtypeid');
        var roomindex = self.data('roomindex');
        var roomid = self.data('roomid');
        var tariffid = self.attr('data-tariffid');
        var adjoininglayer = self.attr('data-adjoininglayer');
        var type = self.parents('.apartment-form-holder').length ? 1 : 0;

        if (Solidres.context == "frontend" && Solidres.options.get('Hub_Dashboard') != 1) {
            var target = roomtypeid + '_' + tariffid + '_' + roomindex;
        } else {
            var target = roomtypeid + '_' + tariffid + '_' + roomid;
        }

        var adult_number = 1;
        if ($("select.adults_number[data-identity='" + target + "']").length) {
            adult_number = $("select.adults_number[data-identity='" + target + "']").val();
        }
        var child_number = 0;
        if ($("select.children_number[data-identity='" + target + "']").length) {
            child_number = $("select.children_number[data-identity='" + target + "']").val();
        }

        if ($("select.guests_number[data-identity='" + target + "']").length) {
            var guest_number = $("select.guests_number[data-identity='" + target + "']").val();
        }

        if (typeof updateChildAgeDropdown === 'undefined' || updateChildAgeDropdown === null) {
            updateChildAgeDropdown = true;
        }

        if (!updateChildAgeDropdown && self.hasClass('reservation-form-child-quantity')) {
            return;
        }

        if (self.hasClass('reservation-form-child-quantity') && child_number >= 1) {
            return;
        }

        var data = {};
        data.raid = raid;
        data.room_type_id = roomtypeid;
        data.room_index = roomindex;
        data.room_id = roomid;
        data.adult_number = adult_number;
        data.child_number = child_number;
        data.type = type;
        if (guest_number) {
            data.guest_number = guest_number;
        }
        if ($('input[name=checkin]').length) {
            data.checkin = $('input[name=checkin]').val();
        }
        if ($('input[name=checkout].trigger_tariff_calculating').length) {
            data.checkout = $('input[name=checkout].trigger_tariff_calculating').val();
        }
        data.tariff_id = tariffid;
        data.adjoining_layer = adjoininglayer;
        data.extras = [];

        for (var i = 0; i < child_number; i++) {
            var prop_name = 'child_age_' + target + '_' + i;
            if ($('.' + prop_name).val()) {
                data[prop_name] = $('.' + prop_name).val();
            }
        }

        var roomExtrasCheckboxes = $(".extras_row_roomtypeform_" + target + " input[type='checkbox']");
        if (roomExtrasCheckboxes.length) {
            roomExtrasCheckboxes.each(function () {
                if (this.checked) {
                    var extra_target = $(this).attr('data-target');
                    data[extra_target] = $(this).parent().find('select#' + extra_target).val();
                    data.extras.push($(this).attr('data-extraid'));
                }
            });
        }

        $.ajax({
            type: 'GET',
            url: Joomla.getOptions('system.paths').base + '/index.php?option=com_solidres&task=reservationasset' + (Solidres.context === "frontend" ? "" : "base") + '.calculateTariff&format=json',
            data: data,
            cache: false,
            success: function (data) {
                if ($('.breakdown_wrapper').length) {
                    $('.breakdown_wrapper').show();
                }

                if (!data.room_index_tariff) return;

                if (!data.room_index_tariff.code && !data.room_index_tariff.value) {
                    if ($('.tariff_' + target).length) {
                        $('.tariff_' + target).text('0');
                    }
                } else {
                    if ($('.tariff_' + target).length) {
                        $('.tariff_' + target).text(data.room_index_tariff.formatted);
                    }
                    $('#breakdown_' + target).empty().html(data.room_index_tariff_breakdown_html);
                }
            },
            dataType: "json"
        });
    });

    $('#solidres').on('click', '.toggle_breakdown', function () {
        $('#breakdown_' + $(this).attr('data-target')).toggle();
    });

    $('#solidres').on('click', '.toggle_extra_details', function () {
        $('#' + $(this).data('target')).toggle();
    });

    $(document).on('click', '.toggle_extracost_confirmation', function () {
        var target = $('.extracost_confirmation');
        var self = $(this);
        target.toggle();
        if (target.is(":hidden")) {
            $('.extracost_row').removeClass().addClass('nobordered extracost_row');
        } else {
            $('.extracost_row').removeClass().addClass('nobordered extracost_row first');
        }
    });

    $('#solidres').on('change', '.reservation-form-child-quantity', function (event, updateChildAgeDropdown) {
        if (typeof updateChildAgeDropdown === 'undefined' || updateChildAgeDropdown === null) {
            updateChildAgeDropdown = true;
        }
        if (!updateChildAgeDropdown) {
            return;
        }
        var self = $(this);
        var quantity = self.val();
        var html = '';
        var raid = self.data('raid');
        var roomtypeid = self.data('roomtypeid');
        var roomid = self.data('roomid');
        var roomindex = self.data('roomindex');
        var tariffid = self.data('tariffid');
        var child_age_holder = self.parents('.occupancy-selection').find('.child-age-details');

        // Backend
        if (typeof child_age_holder === 'undefined' || child_age_holder.length == 0) {
            var child_age_holder = self.parents('.room_selection_details').find('.child-age-details');
        }

        if (quantity > 0) {
            child_age_holder.removeClass('nodisplay');
        } else {
            child_age_holder.addClass('nodisplay');
        }

        if (typeof Solidres.child_max_age_limit !== 'undefined') {
            var childMaxAgeLimit = Solidres.child_max_age_limit;
        } else {
            var childMaxAgeLimit = Joomla.getOptions('com_solidres.apartment').childMaxAgeLimit;
        }

        for (var i = 0; i < quantity; i++) {
            html += '<li>' + Joomla.JText._('SR_CHILD') + ' ' + (i + 1) +
                ' <select name="jform[room_types][' + roomtypeid + '][' + tariffid + '][' + (Solidres.context == "frontend" && Solidres.options.get('Hub_Dashboard') != 1 ? roomindex : roomid) + '][children_ages][' + i + ']" ' +
                'data-raid="' + raid + '"' +
                'data-roomtypeid="' + roomtypeid + '"' +
                'data-roomid="' + roomid + '"' +
                'data-roomindex="' + roomindex + '"' +
                'data-tariffid="' + tariffid + '"' +
                'required ' +
                'class="form-select child_age_' + roomtypeid + '_' + tariffid + '_' + (Solidres.context == "frontend" && Solidres.options.get('Hub_Dashboard') != 1 ? roomindex : roomid) + '_' + i + ' trigger_tariff_calculating"> ';

            html += '<option value=""></option>';

            for (var age = 0; age <= childMaxAgeLimit; age++) {
                html += '<option value="' + age + '">' +
                    (age > 1 ? age + ' ' + Joomla.JText._('SR_CHILD_AGE_SELECTION_JS') : age + ' ' + Joomla.JText._('SR_CHILD_AGE_SELECTION_1_JS')) +
                    '</option>';
            }

            html += '</select></li>';
        }

        child_age_holder.find('ul').empty().append(html);
    });

    var submitReservationForm = function (form) {
        var self = $(form),
            url = self.attr('action'),
            formHolder = self.parent('.reservation-single-step-holder'),
            submitBtn = self.find('button[type=submit]'),
            currentStep = submitBtn.data('step');

        submitBtn.attr('disabled', 'disabled');
        submitBtn.html('<i class="fa fa-arrow-right"></i> ' + Joomla.JText._('SR_PROCESSING'));

        const bookFormAnchor = document.getElementById('book-form');

        if (bookFormAnchor) {
            bookFormAnchor.scrollIntoView(true);
        }

        $.post(url, self.serialize(), function (data) {
            if (data.status == 1) {

                var progressUrl = Joomla.getOptions('system.paths').base + '/index.php?option=com_solidres&task=reservation' + (Solidres.context == 'backend' ? 'base' : '') + '.progress&next_step=' + data.next_step;

                if (data.static == 1) {
                    var confirmForm = $('#sr-reservation-form-confirmation');

                    if (data.next_step == 'confirmation') {
                        var reCaptcha = $('#sr-apartment-captcha textarea[name="g-recaptcha-response"]');

                        if (reCaptcha.length) {
                            confirmForm.append(reCaptcha.clone().removeAttr('id'));
                        }

                        var files = self.find('input[type="file"]');

                        if (files.length) {
                            confirmForm.find('input[type="file"]').remove();
                            confirmForm.append(files.clone().addClass('hide').removeAttr('id'));
                        }

                        confirmForm.submit();
                    } else {
                        location.href = data.redirection;
                    }
                }

                $.ajax({
                    type: 'GET',
                    cache: false,
                    url: progressUrl,
                    success: function (response) {
                        formHolder.addClass('nodisplay');
                        submitBtn.removeClass('nodisplay');

                        if (!submitBtn.hasClass('notxtsubs')) {
                            submitBtn.html('<i class="fa fa-arrow-right"></i> ' + Joomla.JText._('SR_NEXT'));
                        }

                        var next = $('.' + data.next_step);
                        next.removeClass('nodisplay').empty().append(response);

                        if (typeof $.fn.popover === 'function') {
                            next.find('.popover_payment_methods, .hasPopover').popover({
                                'trigger': 'hover',
                                'html': true
                            });
                        } else if (typeof $.fn.webuiPopover === 'function') {
                            next.find('.popover_payment_methods, .hasPopover').webuiPopover({
                                'trigger': 'hover',
                                'placement': 'auto-bottom',
                                'html': true
                            });
                        }

                        if (data.next == 'payment') {
                            $.metadata.setType("attr", "validate");
                        }
                        location.hash = '#book-form';
                        $('.reservation-tab').removeClass('active');
                        $('.reservation-tab-' + currentStep).addClass('complete');
                        $('.reservation-tab-' + currentStep + ' span.badge').removeClass('badge-info').addClass('badge-success');
                        $('.reservation-tab-' + data.next_step).addClass('active');
                        $('.reservation-tab-' + data.next_step + ' span.badge').addClass('badge-info');
                        var next_form = next.find('form.sr-reservation-form');
                        var confirmation_form = next.find('form#sr-reservation-form-confirmation');
                        if (next_form.attr('id') == 'sr-reservation-form-guest') {

                            next_form.validate({
                                rules: {
                                    'jform[customer_email]': {required: true, email: true},
                                    'jform[customer_email2]': {equalTo: '[name="jform[customer_email]"]'},
                                    'jform[payment_method]': {required: true},
                                    'jform[customer_password]': {require: false, minlength: 8},
                                    'jform[customer_username]': {
                                        required: false,
                                        remote: {
                                            url: Joomla.getOptions('system.paths').base + '/index.php?option=com_solidres&task=user.check&format=json',
                                            type: 'POST',
                                            data: {
                                                username: function () {
                                                    return $('#username').val();
                                                }
                                            }
                                        }
                                    }
                                },
                                messages: {
                                    'jform[customer_username]': {
                                        remote: Joomla.JText._('SR_USERNAME_EXISTS')
                                    }
                                }
                            });

                            validateCardForm();

                            next_form.find('input.payment_method_radio:checked').trigger('change');

                            next_form.find('.country_select').trigger('change');

                            if (typeof onSolidresAfterSubmitReservationForm === 'function') {
                                onSolidresAfterSubmitReservationForm();
                            }
                        } else {
                            next_form.validate();
                        }

                        if ($('.rooms-rates-summary.module').length) {
                            var summaryWrapper = $('.rooms-rates-summary.module');
                            if (summarySidebarId) {
                                var summaryWrapperParent = summaryWrapper.parents(summarySidebarId);
                            } else {
                                var summaryWrapperParent = summaryWrapper.parent();
                            }

                            if (confirmation_form.length) {
                                summaryWrapperParent.hide();
                            } else {
                                summaryWrapperParent.show();
                            }
                        }
                    }
                });
            } else if (data.captchaError) {
                submitBtn.html('<i class="fa fa-arrow-right"></i> ' + Joomla.JText._('SR_NEXT')).prop('disabled', false);
                const msg = $('#captcha-message').text(data.message);
                $('html, body').animate({scrollTop: msg.offset().top}, 400);
            }
        }, "json");
    }

    $('#solidres').on('click', '.toggle_room_confirmation', function () {
        $('.rc_' + $(this).data('target')).toggle();
    });

    $('.rooms-rates-summary').on('click', '.toggle_room_confirmation', function () {
        $('.rc_' + $(this).data('target')).toggle();
    });

    $('#solidres').on('submit', 'form.sr-reservation-form', function (event) {
        event.preventDefault();
        submitReservationForm(this);
    });

    $('#solidres').on('submit', 'form#sr-reservation-form-confirmation', function (event) {
        $(this).find("button[type='submit']").prop('disabled', true);
        var confirmForm = $(this);
        confirmForm.find('#filesUpload').remove();
        var filesUpload = $('<div id="filesUpload" style="display:none!important"/>').appendTo(confirmForm);
        var files = $('#sr-reservation-form-guest input[type="file"]');

        if (files.length) {
            files.each(function () {
                filesUpload.append($(this).clone());
            });
        }
    });

    $('#solidres').on('click', '.sr-field-remove-file', function (e) {
        e.preventDefault();

        if (confirm(Joomla.JText._('SR_CUSTOM_FIELD_CONFIRM_DELETE_UPLOAD_FILE', 'Are you sure you want to delete this file?'))) {
            var a = $(this);
            var data = {
                file: a.attr('data-file'),
            };
            data[a.attr('data-token')] = 1;
            a.find('.fa-times').attr('class', 'fa fa-spin fa-spinner');
            $.ajax({
                url: Joomla.getOptions('system.paths').base + '/index.php?option=com_solidres&task=customfield.deleteFile',
                type: 'POST',
                dataType: 'json',
                data: data,
                success: function (response) {
                    if (response.success) {
                        var ref = $(a.attr('data-ref'));

                        if (a.attr('data-required')) {
                            ref.addClass('required');
                        }

                        ref.show();
                        a.parents('.sr-file-wrap').remove();
                    } else {
                        a.find('.fa-spinner').attr('class', 'fa fa-times');
                        alert(response.message);
                    }
                }
            });
        }
    });

    $('.roomtype-reserve-exclusive').click(function () {
        var self = $(this);
        var tariffid = self.data('tariffid');
        var rtid = self.data('rtid');
        $('.tariff-box .exclusive-hidden').prop('disabled', true);
        $('.tariff-box .exclusive-hidden-' + rtid + '-' + tariffid).prop('disabled', false);

        // Either booking full room type or per room is allowed at the same time
        $('.roomtype-quantity-selection.quantity_' + rtid).val('0');
        $('.roomtype-quantity-selection.quantity_' + rtid).trigger('change');

        submitReservationForm(document.getElementById('sr-reservation-form-room'));
    });

    $.fn.srRoomType = function (params) {
        params = $.extend({}, params);

        var bindDeleteRoomRowEvent = function () {
            $('.delete-room-row').unbind().click(function () {
                removeRoomRow(this);
            });
        };

        bindDeleteRoomRowEvent();

        removeRoomRow = function (delBtn) {
            var thisDelBtn = $(delBtn),
                nextSpan = thisDelBtn.next(),
                btnId = thisDelBtn.attr('id');

            nextSpan.addClass('ajax-loading');
            if (btnId != null) {
                roomId = btnId.substring(16);
                $.ajax({
                    url: Joomla.getOptions('system.paths').base + '/index.php?option=com_solidres&task=roomtype' + (Solidres.context == 'frontend' ? 'frontend' : '') + '.checkRoomReservation&tmpl=component&format=json&id=' + roomId,
                    context: document.body,
                    dataType: "JSON",
                    success: function (rs) {
                        nextSpan.removeClass('ajax-loading');
                        if (!rs) {
                            // This room can NOT be deleted
                            nextSpan.addClass('delete-room-row-error');
                            nextSpan.html(Joomla.JText._('SR_FIELD_ROOM_CAN_NOT_DELETE_ROOM') +
                                ' <a class="room-confirm-delete" data-roomid="' + roomId + '" href="#">Yes</a> | <a class="room-cancel-delete" href="#">No</a>');
                            $('.tier-room').on('click', '.room-confirm-delete', function () {
                                $.ajax({
                                    url: Joomla.getOptions('system.paths').base + '/index.php?option=com_solidres&task=roomtype' + (Solidres.context == 'frontend' ? 'frontend' : '') + '.removeRoomPermanently&tmpl=component&format=json&id=' + roomId,
                                    context: document.body,
                                    dataType: "JSON",
                                    success: function (rs) {
                                        if (!rs) {

                                        } else {
                                            // This room can be deleted
                                            thisDelBtn.parent().parent().remove();
                                        }
                                    }
                                });
                            });
                            $('.tier-room').on('click', '.room-cancel-delete', function () {
                                nextSpan.html('');
                            });
                        } else {
                            // This room can be deleted
                            thisDelBtn.parent().parent().remove();
                        }
                    }
                });
            } else {
                // New room, can be deleted since it has not had any relationship with Reservation yet
                thisDelBtn.parent().parent().remove();
            }
        },

            initRoomRow = function () {
                var rowIdRoom = params.rowIdRoom,
                    currentId = 'tier-room-' + rowIdRoom,
                    htmlStr = '';
                $('#room_tbl tbody').append('<tr id="' + currentId + '" class="tier-room"></tr>');
                var a = $('#' + currentId);
                htmlStr += '<td><a class="delete-room-row btn btn-default btn-light"><i class="fa fa-minus"></i></a></td>';
                htmlStr += '<td><input type="text" class="form-control" name="jform[rooms][' + rowIdRoom + '][label]" required />';
                htmlStr += '<input type="hidden" name="jform[rooms][' + rowIdRoom + '][id]" value="new" /></td>';

                a.append(htmlStr);
                bindDeleteRoomRowEvent();
            };

        $('#new-room-tier').click(function (event) {
            event.preventDefault();
            initRoomRow();
            params.rowIdRoom++;
        });

        return this;
    };

    $('#jform_reservation_asset_id').change(function (event) {
        $.ajax({
            url: Joomla.getOptions('system.paths').base + '/index.php?option=com_solidres&format=json&task=coupons' + (Solidres.context == 'frontend' ? 'frontend' : '') + '.find&id=' + $(this).val(),
            success: function (html) {
                $('#coupon-selection-holder').empty().html(html);
            }
        });
        $.ajax({
            url: Joomla.getOptions('system.paths').base + '/index.php?option=com_solidres&format=json&task=extras' + (Solidres.context == 'frontend' ? 'frontend' : '') + '.find&id=' + $(this).val(),
            success: function (html) {
                $('#extra-selection-holder').empty().html(html);
            }
        });
    });

    $('#solidres').on('change', '.occupancy_max_constraint', function () {
        var self = $(this);
        var max = self.data('max');
        var min = self.data('min');
        var roomtypeid = self.data('roomtypeid');
        var leftover = 0;
        var totalSelectable = 0;
        var roomindex = self.data('roomindex');
        var roomid = self.data('roomid');
        var tariffid = self.attr('data-tariffid');

        if (Solidres.context == "frontend") {
            var target = roomindex + '_' + tariffid + '_' + roomtypeid;
        } else {
            var target = roomid + '_' + tariffid + '_' + roomtypeid;
        }

        var targetElm = $('.occupancy_max_constraint_' + target);

        if (max > 0) {
            targetElm.each(function () {
                var s = $(this);
                var val = parseInt(s.val());
                if (val > 0) {
                    leftover += val;
                }
            });

            totalSelectable = max - leftover;

            targetElm.each(function () {
                var s = $(this);
                var val = parseInt(s.val());
                var from = 0;
                if (val > 0) {
                    from = val + totalSelectable;
                } else {
                    from = totalSelectable;
                }
                disableOptions(s, from);
            });
        }

        if (min > 0) {
            var totalAdultChildNumber = 0;
            targetElm.each(function () {
                var s = $(this);
                var val = parseInt(s.val());
                if (val > 0) {
                    totalAdultChildNumber += val;
                }
            });

            if (totalAdultChildNumber < min) {
                $('#error_' + target).show();
                targetElm.addClass('warning');
                if ($('#sr-reservation-form-room').length) {
                    $('#sr-reservation-form-room button[type="submit"]').attr('disabled', 'disabled');
                } else {
                    $('.apartment-form-holder button[type="submit"]').attr('disabled', 'disabled');
                }

            } else {
                $('#error_' + target).hide();
                targetElm.removeClass('warning');
                if ($('#sr-reservation-form-room').length) {
                    $('#sr-reservation-form-room button[type="submit"]').removeAttr('disabled', 'disabled');
                } else {
                    $('.apartment-form-holder button[type="submit"]').removeAttr('disabled', 'disabled');
                }
            }
        }
    });

    function disableOptions(selectEl, from) {
        $('option', selectEl).each(function () {
            var val = parseInt($(this).attr('value'));
            if (val > from) {
                $(this).attr('disabled', 'disabled');
            } else {
                $(this).removeAttr('disabled');
            }
        });
    }

    $('#solidres').on('click', '.reservation_room_select', function () {
        var self = $(this);
        var room_selection_details = $('#room_selection_details_' + self.val());
        var priceTable = $('#room' + self.val() + ' dl dt table');
        var span = $('#room' + self.val() + ' dl dt label span');
        if (self.is(':checked')) {
            room_selection_details.show();
            priceTable.show();
            span.addClass('label-success');
            room_selection_details.find('select.tariff_selection').removeAttr('disabled');
            room_selection_details.find('input.guest_fullname').removeAttr('disabled');
            room_selection_details.find('select.adults_number').removeAttr('disabled');
            room_selection_details.find('select.children_number').removeAttr('disabled');
            $('#room_selection_details_' + self.val() + ' .extras_row_roomtypeform').each(function () {
                var li = $(this);
                var chk = li.find('input:checkbox');
                if (chk.is(':checked')) {
                    var sel = li.find('select');
                    sel.removeAttr('disabled');
                }
            });
            $('#room_selection_details_' + self.val() + ' .extras_row_roomtypeform input:checkbox').trigger('change');
        } else {
            room_selection_details.hide();
            priceTable.hide();
            span.removeClass('label-success');
            room_selection_details.find('select.tariff_selection').attr('disabled', 'disabled');
            room_selection_details.find('input.guest_fullname').attr('disabled', 'disabled');
            room_selection_details.find('select.adults_number').attr('disabled', 'disabled');
            room_selection_details.find('select.children_number').attr('disabled', 'disabled');
            room_selection_details.find('input:hidden').attr('disabled', 'disabled');
            room_selection_details.find('.extras_row_roomtypeform select').attr('disabled', 'disabled');
        }

        isAtLeastOneRoomSelected();
    });

    $('#solidres').on('click', '.room input:checkbox, .guestinfo input:checkbox, .sr-apartment-form input:checkbox', function () {
        var self = $(this);
        var extraItem = $('#' + self.data('target'));
        if (self.is(':checked')) {
            extraItem.removeAttr('disabled');
            extraItem.trigger('change');
        } else {
            extraItem.attr('disabled', 'disabled');
            extraItem.trigger('change');
        }
    });

    $('#solidres').on('click', '.guestinfo input#processonlinepayment', function () {
        var self = $(this);
        if (self.is(':checked')) {
            $('.' + self.data('target')).show();
        } else {
            $('.' + self.data('target')).hide();
        }
    });

    $('#solidres').on('change', '.tariff_selection', function () {
        var self = $(this);
        if (self.val() == '') {
            $('a.tariff_breakdown_' + self.data('roomid')).hide();
            $('span.tariff_breakdown_' + self.data('roomid')).text('0');
            return false;
        }
        var parent = self.parents('.room_selection_wrapper');
        var input = parent.find('.room_selection_details input[type="text"]').not('[name^="jform[roomFields]"]');
        var checkboxes = parent.find('.room_selection_details input[type="checkbox"]').not('[name^="jform[roomFields]"]');
        var select = parent.find('.room_selection_details select').not('.tariff_selection, [name^="jform[roomFields]"]');
        var spans = parent.find('dt span');
        var breakdown_trigger = parent.find('dt a.toggle_breakdown');
        var breakdown_holder = parent.find('dt span.breakdown');
        var extra_wrapper = parent.find('.extras_row_roomtypeform');
        var extra_input_hidden = parent.find('.extras_row_roomtypeform input[type="hidden"]');
        var adjoining_layer = self.find(':selected').data('adjoininglayer');

        input.attr('name', input.attr('name').replace(/^(jform\[room_types\])(\[[0-9]+\])(\[[-?0-9a-z]*\])(.*)$/, '$1$2[' + self.val() + ']$4'));
        if (extra_input_hidden.length > 0) {
            extra_input_hidden.attr('name', extra_input_hidden.attr('name').replace(/^(jform\[room_types\])(\[[0-9]+\])(\[[0-9a-z]*\])(.*)$/, '$1$2[' + self.val() + ']$4'));
        }

        select.each(function () {
            var self_sel = $(this);
            self_sel.attr('name', self_sel.attr('name').replace(/^(jform\[room_types\])(\[[0-9]+\])(\[[-?0-9a-z]*\])(.*)$/, '$1$2[' + self.val() + ']$4'));
            self_sel.attr('data-tariffid', self.val());
            if (self_sel.attr('data-identity')) {
                self_sel.attr('data-identity', self_sel.attr('data-identity').replace(/^([0-9]+)(_)([-?0-9a-z]*)(_)(.*)$/, '$1$2' + self.val() + '$4$5'));
            }
            self_sel.attr('data-adjoininglayer', adjoining_layer);
            if (self_sel.hasClass('extra_quantity')) {
                self_sel.attr('id', self_sel.attr('id').replace(/^([-?0-9a-z]+)(_)([0-9]+)(_)([-?0-9a-z]*)(_)([-?0-9a-z]*)(_)(.*)$/, '$1$2$3$4' + self.val() + '$6$7$8$9'));
            }
        });
        checkboxes.each(function () {
            $(this).removeAttr('disabled');
            if ($(this).attr('data-target')) {
                $(this).attr('data-target', $(this).attr('data-target').replace(/^([a-z]+)(_)([0-9]+)(_)([-?0-9a-z]*)(_)(.*)$/, '$1$2$3$4' + self.val() + '$6$7'));
            }
        });
        breakdown_trigger.attr('data-target', breakdown_trigger.data('target').replace(/^([0-9]+)(_)([0-9a-z]*)(_)(.*)$/, '$1$2' + self.val() + '$4$5'));
        breakdown_holder.attr('id', breakdown_holder.attr('id').replace(/^([a-z]+)(_)([0-9]+)(_)([-?0-9a-z]*)(_)(.*)$/, '$1$2$3$4' + self.val() + '$6$7'));
        spans.each(function () {
            var self_spa = $(this);
            self_spa.attr('class', self_spa.attr('class').replace(/^([a-z]+)(_)([0-9]+)(_)([-?0-9a-z]*)(_)(.*)$/, '$1$2$3$4' + self.val() + '$6$7'));
        });

        if (self.val() != '') {
            $('.tariff_breakdown_' + self.data('roomid')).show();
        } else {
            $('.tariff_breakdown_' + self.data('roomid')).hide();
        }

        if (extra_wrapper.length) {
            extra_wrapper.attr('id', extra_wrapper.attr('id').replace(/^([a-z]+)(_)([a-z]+)(_)([a-z]+)(_)([0-9]+)(_)([-?0-9a-z]*)(_)(.*)$/, '$1$2$3$4$5$6$7$8' + self.val() + '$10$11'));
        }

        $('#room' + self.data('roomid') + ' .adults_number.trigger_tariff_calculating').trigger('change');
    });

    $('#solidres').on('change paste keyup', '#sr-reservation-form-confirmation .total_price_tax_excl_single_line', function () {
        var sum = 0;
        $.each($('.total_price_tax_excl_single_line'), function () {
            sum += parseFloat($(this).val() != '' ? $(this).val() : 0);
        });
        $('.total_price_tax_excl').text(sum);
        updateGrandTotal();
    });

    $('#solidres').on('change paste keyup', '#sr-reservation-form-confirmation .room_price_tax_amount_single_line', function () {
        var sum = 0;
        $.each($('.room_price_tax_amount_single_line'), function () {
            sum += parseFloat($(this).val() != '' ? $(this).val() : 0);
        });
        $('.tax_amount').val(sum);
        updateGrandTotal();
    });

    $('#solidres').on('change paste keyup', '#sr-reservation-form-confirmation .tax_amount', function () {
        updateGrandTotal();
    });

    $('#solidres').on('change paste keyup', '#sr-reservation-form-confirmation .extra_price_single_line', function () {
        var sum = 0;
        $.each($('.extra_price_single_line'), function () {
            sum += parseFloat($(this).val() != '' ? $(this).val() : 0);
        });
        $('.total_extra_price').text(sum);
        updateGrandTotal();
    });

    $('#solidres').on('change paste keyup', '#sr-reservation-form-confirmation .extra_tax_single_line', function () {
        var sum = 0;
        $.each($('.extra_tax_single_line'), function () {
            sum += parseFloat($(this).val() != '' ? $(this).val() : 0);
        });
        $('.total_extra_tax').text(sum);
        updateGrandTotal();
    });

    $('#solidres').on('change paste keyup', '#sr-reservation-form-confirmation .total_discount', function () {
        var sum = 0;
        $.each($('.total_discount'), function () {
            sum += parseFloat($(this).val() != '' ? $(this).val() : 0);
        });
        updateGrandTotal();
    });

    function updateGrandTotal() {
        sum = 0;
        $.each($('.grand_total_sub'), function () {

            if ($(this).val()) {
                sum += parseFloat($(this).val());
            } else if ($(this).attr('val')) {
                sum += parseFloat($(this).attr('val'));
            }

        });
        $('.grand_total').text(sum);
    }

    $('.toggle_child_ages').click(function () {
        $(this).next('ul').toggle();
    });

    if ($('#sr-upload-content').length) {
        $('#sr-upload-content').slideUp('fast');

        $(document).on('click', '#media-upload', function () {
            $('#sr-upload-content').slideToggle();
        });
    }

    $(document).on('click', '[data-media-id]', function (e) {
        if (e.target.nodeName !== 'INPUT' && e.target.nodeName !== 'LABEL') {
            var checkbox = $(this).find('input.media-checkbox');
            checkbox.prop('checked', !checkbox.prop('checked'));
        }
    });

    $('#solidres').on('click', '#media-toggle', function () {
        var btn = $(this);
        var media = btn.parents('#media-content').find('#media-lib-wrap');

        if (media.length) {
            btn.html('<i class="fa fa-' + (btn.data('viewMode') == 'grid' ? 'th-large' : 'list') + '"></i>');
            var viewMode = btn.data('viewMode') === 'list' ? 'grid' : 'list';
            media.html('<div class="processing"></div>');
            btn.data('viewMode', viewMode);
            loadFormContents();
        }
    });

    $('.res-payment-method-id').click(function () {
        $('#res-payment-method-txn-id-' + $(this).data('target')).toggle();
    });

    const reservationNoteForm = document.getElementById('reservationnote-form');

    if (reservationNoteForm) {
        reservationNoteForm.addEventListener('submit', function(event) {
            const action = reservationNoteForm.action;
            const submitBtn = reservationNoteForm.querySelector('button[type=submit]');
            const processingIndicator = reservationNoteForm.querySelector('div.processing');

            submitBtn.disabled = true;
            submitBtn.classList.add('nodisplay');
            processingIndicator.classList.remove('nodisplay');
            processingIndicator.classList.add('active');

            Joomla.request({
                url: action,
                method: 'POST',
                data: new FormData(reservationNoteForm),
                perform: true,
                onSuccess: rawJson => {

                    let response = JSON.parse(rawJson);

                    submitBtn.classList.remove('nodisplay');
                    submitBtn.disabled = false;
                    processingIndicator.classList.add('nodisplay');
                    processingIndicator.classList.remove('active');

                    const holder = document.getElementById('reservation-note-holder');

                    holder.insertAdjacentHTML('beforeend', response.note_html);
                    reservationNoteForm.querySelector('textarea').value = '';
                    reservationNoteForm.querySelector('input[type="checkbox"]').checked = false;
                    reservationNoteForm.querySelector('input[type="file"]').value = '';
                },
                onError: () => {
                }
            });

            event.preventDefault();
        });
    }

    $('#solidres .room').on('change', '.extras_row_roomtypeform input:checkbox', function () {
        var chk = $(this);
        var extraId = chk.data('extraid');
        parent = chk.parents('.room-form-item').find('.assigned-extra');
        if (chk.is(':checked') && parent.hasClass('extra-' + extraId)) {
            parent.show();
        } else if (!chk.is(':checked') && parent.hasClass('extra-' + extraId)) {
            parent.hide();
        }
    });

    var reloadSum = function (form) {
        var self = $(form),
            url = self.attr('action');

        $.post(url, self.serialize() + '&jform[reloadSum]=1', function (data) {
            if (data.status == 1 && data.next_step == '') {
                Solidres.getSummary();
            }
        }, "json");
    }

    $('#solidres').on('change', '.reload-sum', function () {
        reloadSum(document.getElementById('sr-reservation-form-guest'));
    });


    $('#solidres').on('click', '.extras_toggle', function () {
        $('.extras_row_roomtypeform_' + $(this).data('target')).toggle();
    });

    $('.toggle-discount-sub-lines').click(function () {
        $(this).siblings('.sub-line-item').toggle();
    });
});

Solidres.placeHolder = function (container, action) {
    var $ = Solidres.jQuery;

    if (container) {
        container = $(container);
    } else {
        container = $('#solidres');
    }

    var placeHolders = container.find('[sr-placeholder-item]');
    var placeHolder = container.find('.sr-placeholder-wrap');

    if (placeHolders.length) {
        if (action === 'show') {
            var el;
            placeHolders.html(function () {
                return '<div class="sr-placeholder">' + $(this).html() + '</div>';
            }).find('.sr-placeholder').each(function () {
                el = $(this);
                if (el.find('>img').length) {
                    el.css({
                        position: 'relative',
                        textAlign: 'center',
                        display: 'block',
                        padding: '25px 0',
                        marginBottom: 5
                    })
                        .html('<i class="fa fa-image" style="font-size: 50px; color: #ddd; margin: auto;"></i>');
                } else {
                    el.html(function () {
                        return '<div style="visibility: hidden">' + $(this).html() + '</div>';
                    });
                }
            });

            container.find('.sr-placeholder-hidden').hide();
        }
    } else {
        if (!placeHolder.length) {
            placeHolder = $('<div class="sr-placeholder-wrap" style="display: none; position: relative; width: 100%;">'
                + '<div class="sr-placeholder" style="width: 100%; height: 70px;"></div>'
                + '<div class="sr-placeholder" style="position: absolute; left: 0; top: 5px; right: 0; width: 98%; height: 58px; margin: auto; text-align: center;"><i class="fa fa-image" style="font-size: 50px; color: #ddd; margin-top: 5px;"></i></div>'
                + '<div class="sr-placeholder" style="display: block; margin-bottom: 5px; width: 50%; height: 15px;"></div>'
                + '<div class="sr-placeholder" style="width: 50%; height: 15px;"></div>'
                + '</div>');
            container.append(placeHolder);
        }

        if (action === 'show') {
            container.html(placeHolder.show());
        } else if (action === 'hide') {
            placeHolder.hide();
        }
    }
};

Solidres.getSummary = function () {
    var $ = Solidres.jQuery;
    var summaryWrapper = $('.rooms-rates-summary.module');
    var summaryStickyWrapper = $('.rooms-rates-summary-sticky');
    var isApartmentView = summaryWrapper.hasClass('apartment_view');
    $.ajax({
        type: 'GET',
        cache: false,
        url: Joomla.getOptions('system.paths').base + '/index.php?option=com_solidres&task=reservation' + (Solidres.context == 'backend' ? 'base' : '') + '.getSummary&type=' + (isApartmentView ? 1 : 0),
        beforeSend: function () {
            summaryWrapper.remove('.sticky-loading').append($('<div class="sticky-loading"></div>'));
            var stickyWidth = summaryStickyWrapper.parent().width() - parseInt(summaryStickyWrapper.css('padding-left')) - parseInt((summaryStickyWrapper.css('padding-right')));
            var stickyHeight = summaryWrapper.height();
            $('.sticky-loading').css({'width': stickyWidth, 'height': stickyHeight});
        },
        complete: function () {
            summaryWrapper.remove('.sticky-loading');
        },
        success: function (response) {
            summaryWrapper.empty().append(response);
            $.ajax({
                type: 'GET',
                cache: false,
                url: Joomla.getOptions('system.paths').base + '/index.php?option=com_solidres&task=reservation' + (Solidres.context == 'backend' ? 'base' : '') + '.getOverviewCost&format=json',
                success: function (response) {
                    $('.overview-cost-grandtotal').empty().append(response.grand_total);
                }
            });
        }
    });
}

Solidres.loadingLayer = function (show = true) {
    const isJ4 = Solidres.options.get('JVersion') == 4;

    if (show) {
        if (isJ4) {
            document.body.appendChild(document.createElement('joomla-core-loader'));
        } else {
            Joomla.loadingLayer('show');
        }
    } else {
        if (isJ4) {
            const spinnerElement = document.querySelector('joomla-core-loader');
            spinnerElement.parentNode.removeChild(spinnerElement);
        } else {
            Joomla.loadingLayer('hide');
        }
    }
};
