"use strict";

function _typeof(n) {
    return (_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(n) {
        return typeof n
    } : function(n) {
        return n && "function" == typeof Symbol && n.constructor === Symbol && n !== Symbol.prototype ? "symbol" : typeof n
    })(n)
}
$(function() {
        $(".tebexLogin").attr("style", "display:none!important;visibility:hidden!important")
    }), window.initNdznDD = function() {
        var n = 0 < arguments.length && void 0 !== arguments[0] ? arguments[0] : window.document.body;
        $(n).find(".ndzn-js--dd").each(function() {
            var n = Math.floor(1e5 + 9e5 * Math.random());
            $(this).attr("data-ndzn-id", n)
        })
    }, $(function() {
        window.initNdznDD()
    }), $(document).on("click", ".ndzn-js--ddToggle", function(n) {
        n.ndznDdId = $(this).closest(".ndzn-js--dd").attr("data-ndzn-id"), $(this).closest(".ndzn-js--dd").toggleClass("is--open")
    }), $(document).on("click", function(n) {
        var t = $(n.target).closest(".ndzn-js--ddMenu");
        if (0 === t.length) {
            var o = "";
            "ndznDdId" in n && (o = ':not([data-ndzn-id="'.concat(n.ndznDdId, '"])')), $(".ndzn-js--dd.is--open".concat(o)).removeClass("is--open")
        } else {
            var e = t.closest(".ndzn-js--dd").attr("data-ndzn-id"),
                a = '.ndzn-js--dd.is--open:not([data-ndzn-id="'.concat(e, '"])');
            $(a).removeClass("is--open")
        }
    }), $(document).on("show.bs.dropdown", function(n) {
        $(n.relatedTarget).closest(".ndzn-js--ddMenu").length || $(".ndzn-js--dd").removeClass("is--open")
    }), $(document).on("click", ".ndzn-js--scrollTop", function(n) {
        $("html,body").animate({
            scrollTop: 0
        }, 300)
    }),
    function(n) {
        "function" == typeof define && define.amd ? define(["jquery"], n) : "undefined" != typeof module && module.exports ? module.exports = n(require("jquery")) : n(jQuery)
    }(function(i) {
        function v(n) {
            return !n.nodeName || -1 !== i.inArray(n.nodeName.toLowerCase(), ["iframe", "#document", "html", "body"])
        }

        function t(n) {
            return i.isFunction(n) || i.isPlainObject(n) ? n : {
                top: n,
                left: n
            }
        }
        var z = i.scrollTo = function(n, t, o) {
            return i(window).scrollTo(n, t, o)
        };
        return z.defaults = {
            axis: "xy",
            duration: 0,
            limit: !0
        }, i.fn.scrollTo = function(n, o, h) {
            "object" === _typeof(o) && (h = o, o = 0), "function" == typeof h && (h = {
                onAfter: h
            }), "max" === n && (n = 9e9), h = i.extend({}, z.defaults, h), o = o || h.duration;
            var g = h.queue && 1 < h.axis.length;
            return g && (o /= 2), h.offset = t(h.offset), h.over = t(h.over), this.each(function() {
                function s(n) {
                    var t = i.extend({}, h, {
                        queue: !0,
                        duration: o,
                        complete: n && function() {
                            n.call(l, p, h)
                        }
                    });
                    u.animate(m, t)
                }
                if (null !== n) {
                    var c, r = v(this),
                        l = r ? this.contentWindow || window : this,
                        u = i(l),
                        p = n,
                        m = {};
                    switch (_typeof(p)) {
                        case "number":
                        case "string":
                            if (/^([+-]=?)?\d+(\.\d+)?(px|%)?$/.test(p)) {
                                p = t(p);
                                break
                            }
                            p = r ? i(p) : i(p, l);
                        case "object":
                            if (0 === p.length) return;
                            (p.is || p.style) && (c = (p = i(p)).offset())
                    }
                    var f = i.isFunction(h.offset) && h.offset(l, p) || h.offset;
                    i.each(h.axis.split(""), function(n, t) {
                        var o = "x" === t ? "Left" : "Top",
                            e = o.toLowerCase(),
                            a = "scroll" + o,
                            d = u[a](),
                            i = z.max(l, t);
                        c ? (m[a] = c[e] + (r ? 0 : d - u.offset()[e]), h.margin && (m[a] -= parseInt(p.css("margin" + o), 10) || 0, m[a] -= parseInt(p.css("border" + o + "Width"), 10) || 0), m[a] += f[e] || 0, h.over[e] && (m[a] += p["x" === t ? "width" : "height"]() * h.over[e])) : (o = p[e], m[a] = o.slice && "%" === o.slice(-1) ? parseFloat(o) / 100 * i : o), h.limit && /^\d+$/.test(m[a]) && (m[a] = m[a] <= 0 ? 0 : Math.min(m[a], i)), !n && 1 < h.axis.length && (d === m[a] ? m = {} : g && (s(h.onAfterFirst), m = {}))
                    }), s(h.onAfter)
                }
            })
        }, z.max = function(n, t) {
            var o = "scroll" + (e = "x" === t ? "Width" : "Height");
            if (!v(n)) return n[o] - i(n)[e.toLowerCase()]();
            var e = "client" + e,
                a = (d = n.ownerDocument || n.document).documentElement,
                d = d.body;
            return Math.max(a[o], d[o]) - Math.min(a[e], d[e])
        }, i.Tween.propHooks.scrollLeft = i.Tween.propHooks.scrollTop = {
            get: function(n) {
                return i(n.elem)[n.prop]()
            },
            set: function(n) {
                var t = this.get(n);
                if (n.options.interrupt && n._last && n._last !== t) return i(n.elem).stop();
                var o = Math.round(n.now);
                t !== o && (i(n.elem)[n.prop](o), n._last = this.get(n))
            }
        }, z
    }), window.ndzn_core = {
        server_ip: "mognetwork.minecraft.best",
        discord_invite_link: "https://discord.gg/moggaming",
        discord_api_key: "267615559712112640"
    }, $(".ndzn-js--playercount").length && ndzn_core.server_ip.length && $.get("https://mcapi.us/server/status?ip=" + ndzn_core.server_ip, function(n) {
        if ("success" !== n.status) return null;
        $(".ndzn-js--playercount").html(n.players.now)
    }), $(document).on("click", ".ndzn-js--discordinvite", function() {
        window.open(ndzn_core.discord_invite_link, "_blank")
    }), $(".ndzn-js--discordcount").length && ndzn_core.discord_api_key.length && (window.onerror = function(n, t, o) {
        return "Uncaught TypeError: Cannot read property 'removeClassTransitioned' of undefined" === n
    }, $.get("https://discordapp.com/api/guilds/" + ndzn_core.discord_api_key + "/embed.json", function(n) {
        $(".ndzn-js--discordcount").html(n.presence_count)
    })), $(function() {
        $(".panel--ndzn-login").length && $(".panel--ndzn-login .form-control").focus()
    });
var buttons = document.querySelectorAll(".ndzn-js--changeStage"),
    stagesContainer = document.querySelector(".stages-container");
$(function() {
    window.NDZN_MBN && window.ndznMobileNavigate(window.NDZN_MBN[0], window.NDZN_MBN[1], window.NDZN_MBN[2])
}), window.ndznMobileNavigate = function(n) {
    var t = 1 < arguments.length && void 0 !== arguments[1] && arguments[1],
        o = 2 < arguments.length && void 0 !== arguments[2] && arguments[2],
        e = -100 * (n - 1);
    t && ($("#ndzn-mobile-menu .stage-2 .nav-body").hide(), $("#ndzn-mobile-menu .stage-2").find(t).show()), o && $("#ndzn-mobile-menu .stage-2 .sub-title").html(o), stagesContainer.style.transform = "translateX(".concat(e, "%)")
}, $(document).on("click", ".ndzn-js--changeStage", function(n) {
    n.preventDefault();
    var t = $(this).get(0);
    if (t.hasAttribute("data-level")) {
        var o = t.dataset.level,
            e = t.dataset.content || !1,
            a = t.dataset.title || !1;
        window.ndznMobileNavigate(o, e, a)
    }
}), window.ndznAdjustMobileNav = function() {
    var n = $(window).width();
    362 < n && (n = 362), $("#ndzn-mobile-menu .stage").css({
        width: n,
        flexBasis: n
    })
}, $(ndznAdjustMobileNav), $(window).on("resize", ndznAdjustMobileNav);
var heading = document.querySelectorAll(".ndzn-js--moduleHeading");

function scrollTopIfTitleInvisible() {
    var n = $("#ndzn-title");
    if (1 === n.length) {
        var t = $(window).scrollTop(),
            o = n.offset().top;
        o + n.outerHeight() < t && $("html, body").animate({
            scrollTop: o - 4
        }, 200)
    }
}
heading.forEach(function(n) {
    n.addEventListener("click", function() {
        n.classList.contains("module-open") ? n.classList.remove("module-open") : n.classList.add("module-open")
    })
}), window.ndznOpenPopups = 0, $("#popup-modal").on("shown.bs.modal", function() {
    window.ndznOpenPopups++, NoScroll(!0)
}), $("#popup-modal").on("hidden.bs.modal", function() {
    window.ndznOpenPopups--, 0 === window.ndznOpenPopups && NoScroll(!1)
}), window.ndznCustomPopup = function(n, t) {
    var o = $(t);
    "show" === n ? (NoScroll(!0), window.ndznOpenPopups++, o.addClass("open"), setTimeout(function() {
        o.addClass("showContent")
    }, 0)) : "hide" === n && (o.removeClass("showContent"), window.ndznOpenPopups--, setTimeout(function() {
        o.removeClass("open"), 0 === window.ndznOpenPopups && NoScroll(!1)
    }, 150))
}, $(document).on("click", ".ndzn-js--mobileMenuOpen", function() {
    ndznCustomPopup("show", "#ndzn-mobile-menu")
}), $(document).on("click", ".ndzn-js-mobileMenuClose", function() {
    ndznCustomPopup("hide", "#ndzn-mobile-menu")
}), $(document).on("click", ".ndzn-js--desktopMenuOpen", function() {
    ndznCustomPopup("show", "#ndzn-desktop-menu")
}), $(document).on("click", ".ndzn-js--desktopMenuClose", function() {
    ndznCustomPopup("hide", "#ndzn-desktop-menu")
}), $(document).on("click", ".ndzn-js--cartPopupOpen", function() {
    ndznCustomPopup("show", "#ndzn-cart-popup")
}), $(document).on("click", ".ndzn-js--cartPopupClose", function() {
    ndznCustomPopup("hide", "#ndzn-cart-popup")
}), new ClipboardJS(".ndzn-js--copyip", {
    text: function() {
        return ndzn_core.server_ip
    }
}).on("success", function(n) {
    ndznCustomPopup("show", "#ndzn-ip-copied")
}), $(document).on("click", ".ndzn-js--ipCopiedClose", function() {
    ndznCustomPopup("hide", "#ndzn-ip-copied")
}), $(document).on("click", ".ndzn-js--freerankOpen", function() {
    ndznCustomPopup("show", "#ndzn-free-rank"), setTimeout(function() {
        var n = document.querySelector(":focus");
        n && n.blur()
    }, 250)
}), $(document).on("click", ".ndzn-js--freerankClose", function() {
    ndznCustomPopup("hide", "#ndzn-free-rank")
}), $(document).on("click", ".ndzn-js--freerankGuest", function(n) {
    n.preventDefault(), sessionStorage.setItem("frpopup", "yes"), window.location.href = "/login"
}), $(function() {
    sessionStorage.getItem("frpopup") && 0 === $(".panel--ndzn-login").length && (ndznCustomPopup("show", "#ndzn-free-rank"), sessionStorage.removeItem("frpopup"))
}), $(".ndzn-checkbox-parent").click(function() {
    var n = $(this).find('input[type="checkbox"]'),
        t = n.is(":checked");
    $(this).toggleClass("is-checked", !t), n.prop("checked", !t);
    var o = $("#ndzn-checkout form.part-checkout input:checkbox:not(:checked)");
    console.log(o), $(".checkout-payments-methods .payment").toggleClass("off", 0 < o.length)
}), $.fn.countTo = function(n) {
    return this.each(function() {
        var t = $(this),
            n = parseInt(t.attr("data-count-from")),
            o = parseInt(t.attr("data-count-to")),
            e = t.attr("data-count-speed"),
            a = n;
        requestAnimationFrame(function n() {
            a < o ? (t.text(Math.floor(a)), a += e / 2.5, requestAnimationFrame(n)) : t.text(o)
        })
    })
};
var ACTION_ADDED = "added",
    ACTION_ADDED_ONE = "added_one",
    ACTION_SUBMIT_OPTIONS = "submit_options",
    ACTION_REMOVED = "removed",
    ACTION_REMOVED_ONE = "removed_one",
    ACTION_ADD_COUPON = "add_coupon",
    ACTION_REMOVE_COUPON = "remove_coupon",
    NDZN_CART_LOADING = !1;

function updatePackageElements() {
    var n = 0 < arguments.length && void 0 !== arguments[0] && arguments[0],
        o = 1 < arguments.length && void 0 !== arguments[1] && arguments[1];
    if ($(".category--ndzn-ajax").length) {
        if (!o) {
            var t = getDomDataJson();
            o = t.basket
        }!1 === n ? $(".category--ndzn-ajax .ndzn-ajax-package").each(function() {
            e(this)
        }) : n instanceof Array && n.forEach(function(n) {
            e($('.category--ndzn-ajax .ndzn-ajax-package[data-id="' + n + '"]'))
        }), $(".category--ndzn-ajax").removeClass("loading")
    }

    function e(n) {
        var t = searchQtyFromId($(n).attr("data-id"), o);
        $(n).attr("data-qty", t), $(n).find(".packageQty").html(t).attr("data-qty", t)
    }
}

function searchQtyFromId(n, t) {
    var o = t.packages_index.indexOf(n);
    return -1 === o ? 0 : t.packages[o].quantity
}

function getDomDataJson() {
    var n = $("#ndzn-ajax-data");
    return n.length ? $.parseJSON(n.html()) : {}
}

function setDomDataJson(n) {
    $("#ndzn-ajax-data").html(n)
}

function setLoading(n) {
    !0 === (NDZN_CART_LOADING = n) ? $("body").addClass("ndzn-ajax--loading") : $("body").removeClass("ndzn-ajax--loading")
}

function loginMiddleware(n) {
    window.NDZN_AFTER_LOGIN = n, $("#popup-modal").modal("hide"), ndznCustomPopup("show", "#ndzn-login-popup"), setTimeout(function() {
        $("#ndzn-login-popup .form-control").focus()
    }, 300)
}

function toast() {
    var n, t = 0 < arguments.length && void 0 !== arguments[0] ? arguments[0] : ACTION_ADDED,
        o = 1 < arguments.length ? arguments[1] : void 0;
    n = o.packages.length ? "Your cart now has ".concat(o.packages.length, " item").concat(1 === o.packages.length ? " priced at" : "s totalling", " ").concat(o.price, " ").concat(o.currency, ".") : "Your basket is now empty.", t === ACTION_ADDED || t === ACTION_ADDED_ONE ? $.toast({
        text: n,
        heading: "Added to Cart",
        icon: "success",
        position: "bottom-right",
        hideAfter: 3e3
    }) : t !== ACTION_REMOVED && t !== ACTION_REMOVED_ONE || $.toast({
        text: n,
        heading: "Removed from Cart",
        icon: "error",
        position: "bottom-right",
        hideAfter: 3e3
    })
}

function ajaxRequest(n, p) {
    var t, m = 2 < arguments.length && void 0 !== arguments[2] ? arguments[2] : {},
        f = 3 < arguments.length && void 0 !== arguments[3] ? arguments[3] : function() {};
    setLoading(!0);
    var o = {};
    (t = p === ACTION_REMOVED_ONE || p === ACTION_ADDED_ONE ? (o["quantity[" + m.packageId + "]"] = m.newQuantity, $.ajax({
        type: "POST",
        url: _devurl("/checkout/update"),
        data: o
    })) : p === ACTION_SUBMIT_OPTIONS ? (n = _devurl("/checkout/packages/add/" + m.packageId + "/single"), o = m.optionsForm, $.ajax({
        type: "POST",
        url: n,
        data: o
    })) : p === ACTION_ADD_COUPON ? $.ajax({
        type: "POST",
        data: m.form,
        url: n
    }) : $.ajax({
        type: "GET",
        url: n
    })).always(function() {
        setLoading(!1)
    }), t.done(function(n) {
        var t = $(n).filter("div#ndzn-ajax-data");
        if (t.length || (t = $(n).find("div#ndzn-ajax-data")), !t.length) return alert("A critical error has occurred and the page must refresh."), window.location.reload();
        var o = t.text(),
            e = $.parseJSON(o),
            a = [],
            d = $(n).filter("#ndzn-notifications");
        if (d.length || (d = $(n).find("#ndzn-notifications")), d.length && (a = d.children(), console.log(a)), p === ACTION_SUBMIT_OPTIONS && $('.ndzn-ajax--optionsForm button[type="submit"]').removeClass("btn-loading"), p === ACTION_SUBMIT_OPTIONS && a.length) return $.each(a, function(n, t) {
            $(t).find("button").remove(), $("#popup-modal .modal-notification").html('\n\t\t\t\t\t<div class="text">'.concat($(t).text(), "</div>\n\t\t\t\t"))
        }), f(!1);
        if (!e.basket.packages.length && $(".ndzn-checkout-main").length) document.body.style.opacity = .3, document.body.style.pointerEvents = "none", window.document.location.href = _devurl("/");
        else if (a.length) return $.each(a, function(n, t) {
            $(t).find("button").remove(), notification.show("danger", $(t).text())
        }), f(!1);
        if (!0 === e.options_page) {
            var i = $(n).find("#ndzn-options-form").clone();
            return $(i).find("form").addClass("ndzn-ajax--optionsForm").attr("data-itemid", m.packageId), $("#popup-modal").html('\n\t        \t<div class="modal-dialog">\n\t\t\t\t\t<div class="modal-content">\n\t\t\t\t\t\t<div class="modal-header">\n\t\t\t\t\t\t\t<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>\n\t\t\t\t\t\t\t<div class="modal-title">Configure <b>'.concat($(n).find(".page-main .panel-heading").text(), '</b></div>\n\t\t\t\t\t\t</div>\n\t\t\t\t\t\t<div class="modal-body">\n\t\t\t\t\t\t\t<div class="modal-notification"></div>\n\t\t\t\t\t\t\t').concat($(i).html(), "\n\t\t\t\t\t\t</div>\n\t\t\t\t\t</div>\n\t\t\t\t</div>\n            ")), $("#popup-modal").modal("show"), f(!1)
        }
        p === ACTION_SUBMIT_OPTIONS && (p = ACTION_ADDED, $("#popup-modal").html("").modal("hide")), setDomDataJson(o);
        var s = $(n);
        window.initNdznDD(s);
        var c = s.filter("#ndzn-page").find(".sidebar-ajax").html();
        $("#ndzn-page .sidebar-ajax").html(c);
        var r = s.filter("div.ndzn-body").find("#ndzn-user-top").html();
        $(".ndzn-body #ndzn-user-top").html(r);
        var l = s.filter("#ndzn-popup-cart").find(".popup-cart-inner");
        $("#ndzn-popup-cart").hasClass("open") && l.find('.cart-item[data-id="' + [m.packageId] + '"]').addClass("open"), $("#ndzn-popup-cart .popup-cart-inner").html(l.html()), $("#ndzn-popup-cart").hasClass("open") || ndznCustomPopup("show", "#ndzn-popup-cart");
        e.basket.packages.length;
        $(".ndzn-js--basketPrice").html(e.basket.price.toFixed(2) + " " + e.basket.currency), updatePackageElements([m.packageId], e.basket), toast(p, e.basket);
        var u = $("#popup-modal");
        return u.length && u.hasClass("in") && u.find("#ndzn-package-modal").length && u.modal("hide"), f(!0, n)
    }), t.fail(function() {
        return console.error("Error completing AJAX request. Reloading."), window.location.href = n, f(!1)
    })
}

function updatePackageElem(n, t) {
    $(".category--ndzn-ajax").length && $('.category--ndzn-ajax .ndzn-ajax-package[data-id="' + n + '"]').length
}

function objectifyForm(n) {
    for (var t = $(n).serializeArray(), o = {}, e = 0; e < t.length; e++) o[t[e].name] = t[e].value;
    return o
}

function processModal(n) {
    var t = $(n);
    window.NDZN_DEVMODE && (t.find("a[href]").each(function() {
        window._modifyHref(this)
    }), t.find("form[action]").each(function() {
        window._modifyFormAction(this)
    }));
    var a = "";
    t.find(".pm-tab").each(function(n) {
        var t = $(this),
            o = t.find(".__tabid__").text();
        t.find(".__tabid__").remove();
        var e = '\n            <button type="button" class="ndzn-js--packageTab'.concat(0 === n ? " active" : "", '" data-tab="').concat(o, '">\n                ').concat(o, "\n            </button>");
        a += e, t.attr("id", "pm-tab-" + o), 0 === n && t.addClass("active")
    }), a.length && (a = '<div class="part-bottom"><div class="tabs">' + a + "</div></div>", t.find(".modal-header").append(a)), $("#popup-modal").html(t).modal("show")
}
$(function() {
    updatePackageElements()
}), $(document).on("submit", "#ndzn-login-popup form", function(n) {
    n.preventDefault();
    var t = $(this).find(".form-control").val();
    if (t.length) {
        var a = $(this).find(".btn-success"),
            d = $(this).find(".alert-danger");
        a.addClass("btn-loading"), $.ajax({
            url: "#",
            method: "POST",
            data: {
                ign: t
            }
        }).done(function(n) {
            a.removeClass(".btn-loading");
            var t = $(n).filter("div#ndzn-ajax-data");
            if (t.length || (t = $(n).find("div#ndzn-ajax-data")), !t.length) return alert("A critical error has occurred and the page must refresh."), window.location.reload();
            var o = t.text(),
                e = $.parseJSON(o);
            e.notification ? d.html(e.notification.text).slideDown() : window.NDZN_AFTER_LOGIN && (ndznCustomPopup("hide", "#ndzn-login-popup"), window.NDZN_AFTER_LOGIN(), window.NDZN_AFTER_LOGIN = void 0)
        }).fail(function(n) {
            return a.removeClass(".btn-loading")
        })
    }
}), $(document).on("click", ".ndzn-ajax--action", function(n) {
    var t = this;
    if (n.preventDefault(), n.stopImmediatePropagation(), !NDZN_CART_LOADING) {
        var o = !1;
        if ($(this).hasClass("ndzn-ajax--addCart") && (o = ACTION_ADDED), $(this).hasClass("ndzn-ajax--removeCart") && (o = ACTION_REMOVED), $(this).hasClass("ndzn-ajax--removeOne") && (o = ACTION_REMOVED_ONE), o) {
            var e = $(this).closest(".ndzn-ajax-package").attr("data-id");
            e = e || $(this).closest(".modal-footer").attr("data-package-id");
            var a = $(this).attr("href");
            a = a && _devurl(a);
            var d = getDomDataJson(),
                i = 0;
            o === ACTION_REMOVED_ONE ? 0 === (i = searchQtyFromId(e, d.basket) - 1) && (o = ACTION_REMOVED) : o === ACTION_ADDED && 1 < (i = searchQtyFromId(e, d.basket) + 1) && (o = ACTION_ADDED_ONE), a || (o === ACTION_ADDED && (a = _devurl("/checkout/packages/add/".concat(e, "/single"))), o === ACTION_REMOVED && (a = _devurl("/checkout/packages/remove/".concat(e))));
            var s = function() {
                $(t).hasClass("btn") && $(t).addClass("btn-loading"), ajaxRequest(a, o, {
                    packageId: e,
                    newQuantity: i
                }, function() {
                    $(t).removeClass("btn-loading"), [ACTION_ADDED, ACTION_REMOVED].includes(o) && $("#popup-modal").find(".modal-content--package").length && $("#popup-modal").modal("hide")
                })
            };
            d.basket.guest ? loginMiddleware(s) : s()
        } else console.error("[NDZN Cart] Invalid action specified.")
    }
}), $(document).on("submit", ".ndzn-ajax--optionsForm", function(n) {
    $(this).find('button[type="submit"]').addClass("btn-loading"), n.preventDefault();
    var t = objectifyForm(this);
    t.submit = "Continue", ajaxRequest("", ACTION_SUBMIT_OPTIONS, {
        optionsForm: t,
        packageId: $(this).attr("data-itemid")
    })
}), $(document).on("click", ".ndzn-ajax--optionsForm .buttons .btn-danger", function(n) {
    n.preventDefault(), $("#popup-modal").html("").modal("hide")
}), $(document).on("submit", ".ndzn-js--giftForm", function(n) {
    var t = this;
    if (n.preventDefault(), !$(this).hasClass("disabled")) {
        $(this).addClass("disabled"), document.activeElement.blur();
        var o = $(this).find('button[type="submit"]');
        o.addClass("btn-loading");
        var e = $(this).attr("action"),
            a = $(this).find('input[name="username"]').val(),
            d = $(this).attr("data-package-id");
        ajaxRequest(e + "?username=" + a, ACTION_ADDED, {
            packageId: d
        }, function() {
            $(t).removeClass("disabled"), o.removeClass("btn-loading")
        })
    }
}), $(document).on("click", ".ndzn-js--toggleCartItem", function() {
    var n = $(this).closest(".cart-item");
    n.hasClass("open") ? n.removeClass("open") : ($(".cart-body .cart-item.open").removeClass("open"), n.addClass("open"))
}), window.NoScroll = function() {
    if (!(0 < arguments.length && void 0 !== arguments[0]) || arguments[0]) {
        var n = window.innerWidth - document.documentElement.clientWidth;
        document.body.style.marginRight = "".concat(n, "px"), document.body.style.overflow = "hidden", $("#ndzn-bg").css("left", "-".concat(n / 2, "px"))
    } else document.body.style.marginRight = "", document.body.style.overflow = "", $("#ndzn-bg").css("left", "")
}, window.ndznOpenPopups = 0, $("#popup-modal").on("shown.bs.modal", function() {
    window.ndznOpenPopups++, NoScroll(!0)
}), $("#popup-modal").on("hidden.bs.modal", function() {
    window.ndznOpenPopups--, 0 === window.ndznOpenPopups && NoScroll(!1)
}), window.ndznCustomPopup = function(n, t) {
    var o = $(t);
    "show" === n ? (NoScroll(!0), window.ndznOpenPopups++, o.addClass("open"), setTimeout(function() {
        o.addClass("showContent")
    }, 0)) : "hide" === n && (o.removeClass("showContent"), window.ndznOpenPopups--, setTimeout(function() {
        o.removeClass("open"), 0 === window.ndznOpenPopups && NoScroll(!1)
    }, 150))
}, $(document).on("click", ".ndzn-js--mobileNavOpen", function() {
    ndznCustomPopup("show", "#ndzn-mobile-menu")
}), $(document).on("click", ".ndzn-js--mobileNavClose", function() {
    ndznCustomPopup("hide", "#ndzn-mobile-menu")
}), $(document).on("click", ".ndzn-js--realmSelectorOpen", function() {
    ndznCustomPopup("show", "#ndzn-realm-selector")
}), $(document).on("click", ".ndzn-js--realmSelectorClose", function() {
    ndznCustomPopup("hide", "#ndzn-realm-selector")
}), $(document).on("click", ".ndzn-js--navOpen", function() {
    var n = Math.max(document.documentElement.clientWidth || 0, window.innerWidth || 0);
    ndznCustomPopup("show", n <= 1040 ? "#ndzn-mobile-menu" : "#ndzn-realm-selector")
}), $(document).on("click", ".ndzn-js--cartOpen", function() {
    ndznCustomPopup("show", "#ndzn-popup-cart")
}), $(document).on("click", ".ndzn-js--cartClose", function() {
    ndznCustomPopup("hide", "#ndzn-popup-cart")
}), $(document).on("submit", ".ndzn-js--giftcardForm", function(n) {
    n.preventDefault();
    var t = $(this).find(".ndzn-js--giftcardFormInput").val() || "";
    if (!(t.length < 4)) {
        var a = $(this).find(".ndzn-js--giftcardFormResult");
        a.attr("data-color", "").show().find("span").html("Loading..."), $.ajax({
            method: "POST",
            url: _devurl("/#giftcardbalance"),
            data: {
                card_number: t
            }
        }).done(function(n) {
            var t = $(n).find("#ndzn-giftcard-search-outcome"),
                o = "An unknown error occurred.",
                e = "red";
            t.length && "Card balance:" === (o = $(t).html().trim()).substr(0, 13) && (e = "green"), a.attr("data-color", e).find("span").html(o)
        }).fail(function(n) {
            a.attr("data-color", "red").find("span").html("Could not complete a check.")
        })
    }
}), $(document).on("click", ".ndzn-js--resetGiftcardForm", function(n) {
    var t = $(this).closest(".ndzn-js--giftcardForm");
    t.find(".ndzn-js--giftcardFormResult").hide(), t.find(".ndzn-js--giftcardFormInput").val("").focus()
}), $(document).on("click", ".ndzn-js--packageGift", function() {
    var n = $(this).closest(".modal-footer").find(".gift-fields"),
        t = n.is(":hidden");
    $(this).find(".mdi").css("transform", t ? "scaleY(-1)" : ""), n[t ? "slideDown" : "slideUp"]()
}), $(document).on("click", ".ndzn-js--toggleModal", function(n) {
    n.preventDefault(), window.modalLoaderSvg(!0);
    var t = $(this).data("remote");
    "#" === t.substr(0, 1) ? $(t).modal("show") : (t = _devurl(t), $.ajax({
        url: t,
        success: function(n) {
            processModal(n)
        },
        error: function(n) {
            alert("We were unable to display this pop-up."), console.error(n.responseText)
        },
        async: !0
    }))
}), $(document).on("click", ".ndzn-js--packageTab:not(.active)", function(n) {
    n.preventDefault();
    var t = $(this).data("tab");
    $(".ndzn-js--packageTab.active, .pm-tab.active").removeClass("active"), $(this).addClass("active"), $(".pm-tab#pm-tab-".concat(t)).addClass("active")
}), window.initScrollbar = function(n, o) {
    var e = 2 < arguments.length && void 0 !== arguments[2] ? arguments[2] : .35,
        t = $(o).find(".ndzn-js--makeScrollbar")[0];
    if (t) {
        window[n] = new SimpleBar(t);
        var a = window[n].getScrollElement();
        a && a.addEventListener("scroll", function(n) {
            var t = n.target.scrollTop / 200;
            e <= t && (t = e), $(o).find(".ndzn-scrollbar-fade").css("opacity", t)
        })
    }
}, window.modalLoaderSvg = function() {
    if (!(0 < arguments.length && void 0 !== arguments[0]) || arguments[0]) {
        var n = $("#ndznLoaderSvg").html();
        $("#popup-modal").html(n).modal("show")
    } else $("#popup-modal").html("").modal("hide")
};