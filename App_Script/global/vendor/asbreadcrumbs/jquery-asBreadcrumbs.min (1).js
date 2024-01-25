/*! jQuery asBreadcrumbs - v0.1.0 - 2015-05-08
* https://github.com/amazingSurge/jquery-asBreadcrumbs
* Copyright (c) 2015 amazingSurge; Licensed GPL */
!function(a,b,c){"use strict";var d="asBreadcrumbs",e=a[d]=function(b,c){this.element=b,this.$element=a(b),this.options=a.extend({},e.defaults,c,this.$element.data()),this._plugin=d,this.namespace=this.options.namespace,this.$element.addClass(this.namespace),this.disabled=!1,this.initialized=!1,this._trigger("init"),this.init()};e.prototype={constructor:e,init:function(){var b=this;this.createDropList=!1,this.childrenWithWidths=[],this.current=0,this.dropdownWidth=0;var d=this.options.getItem(this.$element);d.each(function(){b.childrenWithWidths.push([a(this),a(this).outerWidth()])}),this.length=this.childrenWithWidths.length,this.$element.addClass(this.namespace+"-"+this.options.overflow),this.createDropdown(),this.deleteDropdown(),this.calculate(),this.options.responsive&&a(c).on("resize",this._throttle(function(){b.resize.call(b)},250)),this.initialized=!0,this._trigger("ready")},_trigger:function(a){var b=Array.prototype.slice.call(arguments,1),c=[this].concat(b);this.$element.trigger(d+"::"+a,c),a=a.replace(/\b\w+\b/g,function(a){return a.substring(0,1).toUpperCase()+a.substring(1)});var e="on"+a;"function"==typeof this.options[e]&&this.options[e].apply(this,b)},createDropdown:function(){if(this.createDropList!==!0){var a=this.options.dropdown();this.$dropdownWrap=this.$element.children().eq(0).clone().removeClass().addClass(this.namespace+"-dropdown").html(a),this.options.ellipsis&&(this.$ellipsis=this.$element.children().eq(0).clone().removeClass().addClass(this.namespace+"-ellipsis").html(this.options.ellipsis)),"right"===this.options.overflow?(this.$dropdownWrap.appendTo(this.$element),this.options.ellipsis&&this.$ellipsis.insertBefore(this.$dropdownWrap)):(this.$dropdownWrap.prependTo(this.$element),this.options.ellipsis&&this.$ellipsis.insertAfter(this.$dropdownWrap)),this.dropdownWidth=this.$dropdownWrap.outerWidth()+(this.options.ellipsis?this.$ellipsis.outerWidth():0),this.createDropList=!0}},deleteDropdown:function(){this.current>1||(this.$element.find("."+this.namespace+"-dropdown").remove(),this.options.ellipsis&&this.$element.find("."+this.namespace+"-ellipsis").remove(),this.createDropList=!1)},_getParameters:function(){var b=0;this.$element.children().each(function(){"inline-block"===a(this).css("display")&&"none"===a(this).css("float")&&(b+=6)}),this.width=this.$element.width()-b,this.childrenWidthTotal=this.createDropList?this.$dropdownWrap.outerWidth()+(this.options.ellipsis?0:this.$ellipsis.outerWidth()):0},calculate:function(){this._getParameters();for(var b,c,d=0;d<this.length;d++)this.current=this.$element.find("."+this.namespace+"-menu").children().length,"left"===this.options.overflow?(b=this.length-d-1,c=this.current-1):(b=d,c=this.length-this.current),this.childrenWidthTotal+=this.childrenWithWidths[b][1],this.childrenWidthTotal+this.dropdownWidth>this.width?(this.createDropdown(),a(this.childrenWithWidths[b][0]).appendTo(this.$element.find("."+this.namespace+"-menu"))):b===c&&this.childrenWidthTotal+this.dropdownWidth<this.width&&(a("left"===this.options.overflow?this.options.ellipsis?this.childrenWithWidths[c][0].insertAfter(this.$ellipsis):this.childrenWithWidths[c][0].insertAfter(this.$dropdownWrap):this.options.ellipsis?this.childrenWithWidths[c][0].insertBefore(this.$ellipsis):this.childrenWithWidths[c][0].insertBefore(this.$dropdownWrap)),this.deleteDropdown())},resize:function(){this._trigger("resize"),this.calculate()},_throttle:function(a,b){var c,d,e,f=Date.now||function(){return(new Date).getTime()},g=null,h=0,i=function(){h=f(),g=null,e=a.apply(c,d),c=d=null};return function(){var j=f(),k=b-(j-h);return c=this,d=arguments,0>=k?(clearTimeout(g),g=null,h=j,e=a.apply(c,d),c=d=null):g||(g=setTimeout(i,k)),e}},destory:function(){this.$element.data(d,null),this._trigger("destory")}},e.defaults={namespace:d,overflow:"left",ellipsis:"&#8230;",dropicon:"caret",responsive:!0,dropdown:function(){return'<div class="dropdown"><a href="javascript:void(0);" class="'+this.namespace+'-toggle" data-toggle="dropdown"><i class="'+this.dropicon+'"></i></a><ul class="'+this.namespace+'-menu dropdown-menu"></ul></div>'},getItem:function(a){return a.children()},onInit:null,onReady:null},a.fn[d]=function(b){if("string"!=typeof b)return this.each(function(){a.data(this,d)||a.data(this,d,new e(this,b))});var c=b,f=Array.prototype.slice.call(arguments,1);if(/^\_/.test(c))return!1;if(!/^(get)/.test(c))return this.each(function(){var b=a.data(this,d);b&&"function"==typeof b[c]&&b[c].apply(b,f)});var g=this.first().data(d);return g&&"function"==typeof g[c]?g[c].apply(g,f):void 0}}(jQuery,document,window);