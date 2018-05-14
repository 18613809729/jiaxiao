<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>驾校简介</title>
	<#include "/head.ftl">
    <style type="text/css">
        @charset "UTF-8"; 

        .pure-button:focus,a:active,a:hover {
            outline: 0
        }

        img,legend {
            border: 0
        }

        .subDialog {
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.6);
            text-align: center;
            z-index: 1000000;
        }
        .subSysDialog {
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.6);
            text-align: center;
            z-index: 1000000;
        }
        .subSys_content {
            background-color: #FFF;
            width: 82%;
            margin: 4em auto 0;
            padding: 5% 0;
            position: relative;
            border-radius:10px;
        }
        .qrcode_content {
            background-color: #FFF;
            width: 82%;
            margin: 4em auto 0;
            padding: 5% 0;
            position: relative;
            border-radius:10px;
        }
        .qrcode_text_tip {
            margin-bottom: 8px;
            font-size: 16px;
        }
        .card_qrcode_head {
            width: 40%;
            margin: 0 auto;
            position: relative;
            z-index: 200;
        }
        .qrcode_wrapper {
            background-color: #966ad7;
            padding: 8% 5% 5%;
            margin: 5% 10% 5%;
            position: relative;
            z-index: 100;
        }
        .card_qrcode_footer {
            width: 95%;
            margin: 0 auto;
        }
        .close_btn {
            position: absolute;
            top: -14px;
            right: -15px;
            width: 25px;
            height: 25px;
            background-color: #FFF;
            background-image:url("/images/x.jpg");
            border-radius: 50%;
        }
        .xuan_mobile{
            bottom: 215px;
            right: 4%;
            width: 50px;
            z-index: 9;
            position: fixed;
            display: none;
        }
        .xuan_bottom_img{
            z-index: 9;
            padding: 0px;
            margin-bottom: 50px;
        }
        .xuan_header_bottom_img{
            z-index: 998;
            padding: 0px;
            display: none;
            margin-bottom: 50px;
        }
        #photoImgDiv{
            width: 100%;height: 80px;background-color:#f0f0f0;text-align: center;
        }
        .pure-table,table {
            border-spacing: 0;
            border-collapse: collapse
        }

        .article .article-info .more span,.article .newsList ul li a {
            -o-text-overflow: ellipsis;
            white-space: nowrap;
            text-overflow: ellipsis
        }

        .article table,.pure-table,table {
            border-collapse: collapse
        }

        @font-face {
            font-family: svgpic;
            src: url(../css/fonts/svgpic.eot?n7nrk7);
            src: url(../css/fonts/svgpic.eot?n7nrk7#iefix)
            format('embedded-opentype'), url(../css/fonts/svgpic.ttf?n7nrk7)
            format('truetype'), url(../css/fonts/svgpic.woff?n7nrk7)
            format('woff'), url(../css/fonts/svgpic.svg?n7nrk7#svg-pic)
            format('svg');
            font-weight: 400;
            font-style: normal
        }

        .on,[class*=" icon-"],[class^=icon-] {
            font-family: svgpic, '微软雅黑' !important;
            speak: none;
            font-style: normal;
            font-weight: 400;
            font-variant: normal;
            text-transform: none;
            line-height: 1;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale
        }

        .icon-eye:before {
            content: "\e000"
        }

        .icon-paper-clip:before {
            content: "\e001"
        }

        .icon-mail:before {
            content: "\e002"
        }

        .icon-toggle:before {
            content: "\e003"
        }

        .icon-layout:before {
            content: "\e004"
        }

        .icon-link:before {
            content: "\e005"
        }

        .icon-bell:before {
            content: "\e006"
        }

        .icon-lock:before {
            content: "\e007"
        }

        .icon-unlock:before {
            content: "\e008"
        }

        .icon-ribbon:before {
            content: "\e009"
        }

        .icon-image:before {
            content: "\e010"
        }

        .icon-signal:before {
            content: "\e011"
        }

        .icon-target:before {
            content: "\e012"
        }

        .icon-clipboard:before {
            content: "\e013"
        }

        .icon-clock:before {
            content: "\e014"
        }

        .icon-watch:before {
            content: "\e015"
        }

        .icon-air-play:before {
            content: "\e016"
        }

        .icon-camera:before {
            content: "\e017"
        }

        .icon-video:before {
            content: "\e018"
        }

        .icon-disc:before {
            content: "\e019"
        }

        .icon-printer:before {
            content: "\e020"
        }

        .icon-monitor:before {
            content: "\e021"
        }

        .icon-server:before {
            content: "\e022"
        }

        .icon-cog:before {
            content: "\e023"
        }

        .icon-heart:before {
            content: "\e024"
        }

        .icon-paragraph:before {
            content: "\e025"
        }

        .icon-align-justify:before {
            content: "\e026"
        }

        .icon-align-left:before {
            content: "\e027"
        }

        .icon-align-center:before {
            content: "\e028"
        }

        .icon-align-right:before {
            content: "\e029"
        }

        .icon-book:before {
            content: "\e030"
        }

        .icon-layers:before {
            content: "\e031"
        }

        .icon-stack:before {
            content: "\e032"
        }

        .icon-stack-2:before {
            content: "\e033"
        }

        .icon-paper:before {
            content: "\e034"
        }

        .icon-paper-stack:before {
            content: "\e035"
        }

        .icon-search:before {
            content: "\e036"
        }

        .icon-zoom-in:before {
            content: "\e037"
        }

        .icon-zoom-out:before {
            content: "\e038"
        }

        .icon-reply:before {
            content: "\e039"
        }

        .icon-circle-plus:before {
            content: "\e040"
        }

        .icon-circle-minus:before {
            content: "\e041"
        }

        .icon-circle-check:before {
            content: "\e042"
        }

        .icon-circle-cross:before {
            content: "\e043"
        }

        .icon-square-plus:before {
            content: "\e044"
        }

        .icon-square-minus:before {
            content: "\e045"
        }

        .icon-square-check:before {
            content: "\e046"
        }

        .icon-square-cross:before {
            content: "\e047"
        }

        .icon-microphone:before {
            content: "\e048"
        }

        .icon-record:before {
            content: "\e049"
        }

        .icon-skip-back:before {
            content: "\e050"
        }

        .icon-rewind:before {
            content: "\e051"
        }

        .icon-play:before {
            content: "\e052"
        }

        .icon-pause:before {
            content: "\e053"
        }

        .icon-stop:before {
            content: "\e054"
        }

        .icon-fast-forward:before {
            content: "\e055"
        }

        .icon-skip-forward:before {
            content: "\e056"
        }

        .icon-shuffle:before {
            content: "\e057"
        }

        .icon-repeat:before {
            content: "\e058"
        }

        .icon-folder:before {
            content: "\e059"
        }

        .icon-umbrella:before {
            content: "\e060"
        }

        .icon-moon:before {
            content: "\e061"
        }

        .icon-thermometer:before {
            content: "\e062"
        }

        .icon-drop:before {
            content: "\e063"
        }

        .icon-sun:before {
            content: "\e064"
        }

        .icon-cloud:before {
            content: "\e065"
        }

        .icon-cloud-upload:before {
            content: "\e066"
        }

        .icon-cloud-download:before {
            content: "\e067"
        }

        .icon-upload:before {
            content: "\e068"
        }

        .icon-download:before {
            content: "\e069"
        }

        .icon-location:before {
            content: "\e070"
        }

        .icon-location-2:before {
            content: "\e071"
        }

        .icon-map:before {
            content: "\e072"
        }

        .icon-battery:before {
            content: "\e073"
        }

        .icon-head:before {
            content: "\e074"
        }

        .icon-briefcase:before {
            content: "\e075"
        }

        .icon-speech-bubble:before {
            content: "\e076"
        }

        .icon-anchor:before {
            content: "\e077"
        }

        .icon-globe:before {
            content: "\e078"
        }

        .icon-box:before {
            content: "\e079"
        }

        .icon-reload:before {
            content: "\e080"
        }

        .icon-share:before {
            content: "\e081"
        }

        .icon-marquee:before {
            content: "\e082"
        }

        .icon-marquee-plus:before {
            content: "\e083"
        }

        .icon-marquee-minus:before {
            content: "\e084"
        }

        .icon-tag:before {
            content: "\e085"
        }

        .icon-power:before {
            content: "\e086"
        }

        .icon-command:before {
            content: "\e087"
        }

        .icon-alt:before {
            content: "\e088"
        }

        .icon-esc:before {
            content: "\e089"
        }

        .icon-bar-graph:before {
            content: "\e090"
        }

        .icon-bar-graph-2:before {
            content: "\e091"
        }

        .icon-pie-graph:before {
            content: "\e092"
        }

        .icon-star:before {
            content: "\e093"
        }

        .icon-arrow-left:before {
            content: "\e094"
        }

        .icon-arrow-right:before {
            content: "\e095"
        }

        .icon-arrow-up:before {
            content: "\e096"
        }

        .icon-arrow-down:before {
            content: "\e097"
        }

        .icon-volume:before {
            content: "\e098"
        }

        .icon-mute:before {
            content: "\e099"
        }

        .icon-content-right:before {
            content: "\e100"
        }

        .icon-content-left:before {
            content: "\e101"
        }

        .icon-grid:before {
            content: "\e102"
        }

        .icon-grid-2:before {
            content: "\e103"
        }

        .icon-columns:before {
            content: "\e104"
        }

        .icon-loader:before {
            content: "\e105"
        }

        .icon-bag:before {
            content: "\e106"
        }

        .icon-ban:before {
            content: "\e107"
        }

        .icon-flag:before {
            content: "\e108"
        }

        .icon-trash:before {
            content: "\e109"
        }

        .icon-expand:before {
            content: "\e110"
        }

        .icon-contract:before {
            content: "\e111"
        }

        .icon-maximize:before {
            content: "\e112"
        }

        .icon-minimize:before {
            content: "\e113"
        }

        .icon-plus:before {
            content: "\e114"
        }

        .icon-minus:before {
            content: "\e115"
        }

        .icon-check:before {
            content: "\e116"
        }

        .icon-cross:before {
            content: "\e117"
        }

        .icon-move:before {
            content: "\e118"
        }

        .icon-delete:before {
            content: "\e119"
        }

        .icon-menu:before {
            content: "\e120"
        }

        .icon-archive:before {
            content: "\e121"
        }

        .icon-inbox:before {
            content: "\e122"
        }

        .icon-outbox:before {
            content: "\e123"
        }

        .icon-file:before {
            content: "\e124"
        }

        .icon-file-add:before {
            content: "\e125"
        }

        .icon-file-subtract:before {
            content: "\e126"
        }

        .icon-help:before {
            content: "\e127"
        }

        .icon-open:before {
            content: "\e128"
        }

        .icon-ellipsis:before {
            content: "\e129"
} /*!
Pure v0.6.0
Copyright 2014 Yahoo! Inc. All rights reserved.
Licensed under the BSD License.
https://github.com/yahoo/pure/blob/master/LICENSE.md
*/ /*!
normalize.css v^3.0 | MIT License | git.io/normalize
Copyright (c) Nicolas Gallagher and Jonathan Neal
*/ /*! normalize.css v3.0.2 | MIT License | git.io/normalize */
html {
    font-family: sans-serif
}

body {
    margin: 0
}

article,aside,details,figcaption,figure,footer,header,hgroup,main,menu,nav,section,summary
{
    display: block
}

audio,canvas,progress,video {
    display: inline-block;
    vertical-align: baseline
}

audio:not ([controls] ){
    display: none;
    height: 0
}

[hidden],template {
    display: none
}

a {
    background-color: transparent
}

abbr[title] {
    border-bottom: 1px dotted
}

b,optgroup,strong {
    font-weight: 700
}

dfn {
    font-style: italic
}

h1 {
    font-size: 2em;
    margin: .67em 0
}

mark {
    background: #ff0;
    color: #000
}

small {
    font-size: 80%
}

sub,sup {
    font-size: 75%;
    line-height: 0;
    position: relative;
    vertical-align: baseline
}

sup {
    top: -.5em
}

sub {
    bottom: -.25em
}

svg:not (:root ){
    overflow: hidden
}

figure {
    margin: 1em 40px
}

hr {
    -moz-box-sizing: content-box;
    box-sizing: content-box;
    height: 0
}

pre,textarea {
    overflow: auto
}

code,kbd,pre,samp {
    font-family: monospace, monospace;
    font-size: 1em
}

button,input,optgroup,select,textarea {
    color: inherit;
    font: inherit;
    margin: 0
}

.pure-button,input {
    line-height: normal
}

button {
    overflow: visible
}

button,select {
    text-transform: none
}

button,html input[type=button],input[type=reset],input[type=submit] {
    -webkit-appearance: button;
    cursor: pointer
}

button[disabled],html input[disabled] {
    cursor: default
}

button::-moz-focus-inner,input::-moz-focus-inner {
    border: 0;
    padding: 0
}

input[type=checkbox],input[type=radio] {
    box-sizing: border-box;
    padding: 0
}

input[type=number]::-webkit-inner-spin-button,input[type=number]::-webkit-outer-spin-button
{
    height: auto
}

input[type=search] {
    -webkit-appearance: textfield;
    -moz-box-sizing: content-box;
    -webkit-box-sizing: content-box;
    box-sizing: content-box
}

input[type=search]::-webkit-search-cancel-button,input[type=search]::-webkit-search-decoration
{
    -webkit-appearance: none
}

fieldset {
    border: 1px solid silver;
    margin: 0 2px;
    padding: .35em .625em .75em
}

legend,td,th {
    padding: 0
}

.hidden,[hidden] {
    display: none !important
}

.pure-img {
    max-width: 100%;
    height: auto;
    display: block
}

.pure-g {
    letter-spacing: -.31em;
    text-rendering: optimizespeed;
    font-family: FreeSans, Arimo, "Droid Sans", Helvetica, Arial, sans-serif;
    -webkit-flex-flow: row wrap;
    display: -ms-flexbox;
    -ms-flex-flow: row wrap;
    -ms-align-content: flex-start;
    -webkit-align-content: flex-start;
    align-content: flex-start
}

.opera-only :-o-prefocus,.pure-g {
    word-spacing: -.43em
}

.pure-u,.pure-u-1,.pure-u-1-1,.pure-u-1-12,.pure-u-1-2,.pure-u-1-24,.pure-u-1-3,.pure-u-1-4,.pure-u-1-5,.pure-u-1-6,.pure-u-1-8,.pure-u-10-24,.pure-u-11-12,.pure-u-11-24,.pure-u-12-24,.pure-u-13-24,.pure-u-14-24,.pure-u-15-24,.pure-u-16-24,.pure-u-17-24,.pure-u-18-24,.pure-u-19-24,.pure-u-2-24,.pure-u-2-3,.pure-u-2-5,.pure-u-20-24,.pure-u-21-24,.pure-u-22-24,.pure-u-23-24,.pure-u-24-24,.pure-u-3-24,.pure-u-3-4,.pure-u-3-5,.pure-u-3-8,.pure-u-4-24,.pure-u-4-5,.pure-u-5-12,.pure-u-5-24,.pure-u-5-5,.pure-u-5-6,.pure-u-5-8,.pure-u-6-24,.pure-u-7-12,.pure-u-7-24,.pure-u-7-8,.pure-u-8-24,.pure-u-9-24
{
    letter-spacing: normal;
    word-spacing: normal;
    vertical-align: top;
    text-rendering: auto;
    display: inline-block;
    zoom: 1
}

.pure-g [class*=pure-u] {
    font-family: sans-serif
}

.pure-u-1-24 {
    width: 4.1667%
}

.pure-u-1-12,.pure-u-2-24 {
    width: 8.3333%
}

.pure-u-1-8,.pure-u-3-24 {
    width: 12.5%
}

.pure-u-1-6,.pure-u-4-24 {
    width: 16.6667%
}

.pure-u-1-5 {
    width: 20%
}

.pure-u-5-24 {
    width: 20.8333%
}

.pure-u-1-4,.pure-u-6-24 {
    width: 25%
}

.pure-u-7-24 {
    width: 29.1667%
}

.pure-u-1-3,.pure-u-8-24 {
    width: 33.3333%
}

.pure-u-3-8,.pure-u-9-24 {
    width: 37.5%
}

.pure-u-2-5 {
    width: 40%
}

.pure-u-10-24,.pure-u-5-12 {
    width: 41.6667%
}

.pure-u-11-24 {
    width: 45.8333%
}

.pure-u-1-2,.pure-u-12-24 {
    width: 50%
}

.pure-u-13-24 {
    width: 54.1667%
}

.pure-u-14-24,.pure-u-7-12 {
    width: 58.3333%
}

.pure-u-3-5 {
    width: 60%
}

.pure-u-15-24,.pure-u-5-8 {
    width: 62.5%
}

.pure-u-16-24,.pure-u-2-3 {
    width: 66.6667%
}

.pure-u-17-24 {
    width: 70.8333%
}

.pure-u-18-24,.pure-u-3-4 {
    width: 75%
}

.pure-u-19-24 {
    width: 79.1667%
}

.pure-u-4-5 {
    width: 80%
}

.pure-u-20-24,.pure-u-5-6 {
    width: 83.3333%
}

.pure-u-21-24,.pure-u-7-8 {
    width: 87.5%
}

.pure-u-11-12,.pure-u-22-24 {
    width: 91.6667%
}

.pure-u-23-24 {
    width: 95.8333%
}

.pure-u-1,.pure-u-1-1,.pure-u-24-24,.pure-u-5-5 {
    width: 100%
}

.pure-button {
    display: inline-block;
    zoom: 1;
    white-space: nowrap;
    vertical-align: middle;
    text-align: center;
    cursor: pointer;
    -webkit-user-drag: none;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    font-family: inherit;
    font-size: 100%;
    padding: .5em 1em;
    color: #444;
    color: rgba(0, 0, 0, .8);
    border: 1px solid #999;
    border: none transparent;
    background-color: #E6E6E6;
    text-decoration: none;
    border-radius: 2px
}

.pure-button-hover,.pure-button:focus,.pure-button:hover {
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00000000',
        endColorstr='#1a000000', GradientType=0);
    background-image: -webkit-gradient(linear, 0 0, 0 100%, from(transparent),
        color-stop(40%, rgba(0, 0, 0, .05)), to(rgba(0, 0, 0, .1)));
    background-image: -webkit-linear-gradient(transparent, rgba(0, 0, 0, .05)
        40%, rgba(0, 0, 0, .1));
    background-image: -moz-linear-gradient(top, rgba(0, 0, 0, .05) 0,
        rgba(0, 0, 0, .1));
    background-image: -o-linear-gradient(transparent, rgba(0, 0, 0, .05) 40%,
        rgba(0, 0, 0, .1));
    background-image: linear-gradient(transparent, rgba(0, 0, 0, .05) 40%,
        rgba(0, 0, 0, .1))
}

.pure-button-active,.pure-button:active {
    box-shadow: 0 0 0 1px rgba(0, 0, 0, .15) inset, 0 0 6px
    rgba(0, 0, 0, .2) inset;
    border-color: #000\9
}

.pure-button-disabled,.pure-button-disabled:active,.pure-button-disabled:focus,.pure-button-disabled:hover,.pure-button[disabled]
{
    border: none;
    background-image: none;
    filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
    filter: alpha(opacity = 40);
    -khtml-opacity: .4;
    -moz-opacity: .4;
    opacity: .4;
    cursor: not-allowed;
    box-shadow: none
}

.pure-button-hidden {
    display: none
}

.pure-button::-moz-focus-inner {
    padding: 0;
    border: 0
}

.pure-button-primary,.pure-button-selected,a.pure-button-primary,a.pure-button-selected
{
    background-color: #0078e7;
    color: #fff
}

.pure-form input[type=number],.pure-form input[type=search],.pure-form input[type=text],.pure-form input[type=password],.pure-form input[type=email],.pure-form input[type=url],.pure-form input[type=date],.pure-form input[type=month],.pure-form input[type=time],.pure-form input[type=datetime],.pure-form input[type=datetime-local],.pure-form input[type=week],.pure-form input[type=tel],.pure-form input[type=color],.pure-form select,.pure-form textarea
{
    padding: .5em .6em;
    display: inline-block;
    border: 1px solid #ccc;
    box-shadow: inset 0 1px 3px #ddd;
    border-radius: 4px;
    vertical-align: middle;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box
}

.pure-form input:not ([type] ){
    padding: .5em .6em;
    display: inline-block;
    border: 1px solid #ccc;
    box-shadow: inset 0 1px 3px #ddd;
    border-radius: 4px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box
}

.pure-form input[type=color] {
    padding: .2em .5em
}

.pure-form input:not ([type] ):focus,.pure-form input[type=number]:focus,.pure-form input[type=search]:focus,.pure-form input[type=text]:focus,.pure-form input[type=password]:focus,.pure-form input[type=email]:focus,.pure-form input[type=url]:focus,.pure-form input[type=date]:focus,.pure-form input[type=month]:focus,.pure-form input[type=time]:focus,.pure-form input[type=datetime]:focus,.pure-form input[type=datetime-local]:focus,.pure-form input[type=week]:focus,.pure-form input[type=tel]:focus,.pure-form input[type=color]:focus,.pure-form select:focus,.pure-form textarea:focus
{
    outline: 0;
    border-color: #129FEA
}

.pure-form input[type=checkbox]:focus,.pure-form input[type=radio]:focus,.pure-form input[type=file]:focus
{
    outline: #129FEA auto 1px
}

.pure-form .pure-checkbox,.pure-form .pure-radio {
    margin: .5em 0;
    display: block
}

.pure-form input:not ([type] )[disabled],.pure-form input[type=number][disabled],.pure-form input[type=search][disabled],.pure-form input[type=text][disabled],.pure-form input[type=password][disabled],.pure-form input[type=email][disabled],.pure-form input[type=url][disabled],.pure-form input[type=date][disabled],.pure-form input[type=month][disabled],.pure-form input[type=time][disabled],.pure-form input[type=datetime][disabled],.pure-form input[type=datetime-local][disabled],.pure-form input[type=week][disabled],.pure-form input[type=tel][disabled],.pure-form input[type=color][disabled],.pure-form select[disabled],.pure-form textarea[disabled]
{
    cursor: not-allowed;
    background-color: #eaeded;
    color: #cad2d3
}

.pure-form input[readonly],.pure-form select[readonly],.pure-form textarea[readonly]
{
    background-color: #eee;
    color: #777;
    border-color: #ccc
}

.pure-form input:focus:invalid,.pure-form select:focus:invalid,.pure-form textarea:focus:invalid
{
    color: #b94a48;
    border-color: #e9322d
}

.pure-form input[type=checkbox]:focus:invalid:focus,.pure-form input[type=radio]:focus:invalid:focus,.pure-form input[type=file]:focus:invalid:focus
{
    outline-color: #e9322d
}

.pure-form select {
    height: 2.25em;
    border: 1px solid #ccc;
    background-color: #fff
}

.pure-form select[multiple] {
    height: auto
}

.pure-form label {
    margin: .5em 0 .2em
}

.pure-form fieldset {
    margin: 0;
    padding: .35em 0 .75em;
    border: 0
}

.pure-form legend {
    display: block;
    width: 100%;
    padding: .3em 0;
    margin-bottom: .3em;
    color: #333;
    border-bottom: 1px solid #e5e5e5
}

.pure-form-stacked input:not ([type] ),.pure-form-stacked input[type=number],.pure-form-stacked input[type=search],.pure-form-stacked input[type=text],.pure-form-stacked input[type=password],.pure-form-stacked input[type=email],.pure-form-stacked input[type=url],.pure-form-stacked input[type=date],.pure-form-stacked input[type=month],.pure-form-stacked input[type=time],.pure-form-stacked input[type=datetime],.pure-form-stacked input[type=datetime-local],.pure-form-stacked input[type=week],.pure-form-stacked input[type=tel],.pure-form-stacked input[type=color],.pure-form-stacked input[type=file],.pure-form-stacked label,.pure-form-stacked select,.pure-form-stacked textarea
{
    display: block;
    margin: .25em 0
}

.pure-form-aligned .pure-help-inline,.pure-form-aligned input,.pure-form-aligned select,.pure-form-aligned textarea,.pure-form-message-inline
{
    display: inline-block;
    vertical-align: middle
}

.pure-form-aligned textarea {
    vertical-align: top
}

.pure-form-aligned .pure-control-group {
    margin-bottom: .5em
}

.pure-form-aligned .pure-control-group label {
    text-align: right;
    display: inline-block;
    vertical-align: middle;
    width: 10em;
    margin: 0 1em 0 0
}

.pure-form-aligned .pure-controls {
    margin: 1.5em 0 0 11em
}

.pure-form .pure-input-rounded,.pure-form input.pure-input-rounded {
    border-radius: 2em;
    padding: .5em 1em
}

.pure-form .pure-group fieldset {
    margin-bottom: 10px
}

.pure-form .pure-group input,.pure-form .pure-group textarea {
    display: block;
    padding: 10px;
    margin: 0 0 -1px;
    border-radius: 0;
    position: relative;
    top: -1px
}

.pure-form .pure-group input:focus,.pure-form .pure-group textarea:focus
{
    z-index: 3
}

.pure-form .pure-group input:first-child,.pure-form .pure-group textarea:first-child
{
    top: 1px;
    border-radius: 4px 4px 0 0;
    margin: 0
}

.pure-form .pure-group input:first-child:last-child,.pure-form .pure-group textarea:first-child:last-child
{
    top: 1px;
    border-radius: 4px;
    margin: 0
}

.pure-form .pure-group input:last-child,.pure-form .pure-group textarea:last-child
{
    top: -2px;
    border-radius: 0 0 4px 4px;
    margin: 0
}

.pure-form .pure-group button {
    margin: .35em 0
}

.pure-form .pure-input-1 {
    width: 100%
}

.pure-form .pure-input-2-3 {
    width: 66%
}

.pure-form .pure-input-1-2 {
    width: 50%
}

.pure-form .pure-input-1-3 {
    width: 33%
}

.pure-form .pure-input-1-4 {
    width: 25%
}

.pure-form .pure-help-inline,.pure-form-message-inline {
    display: inline-block;
    padding-left: .3em;
    color: #666;
    vertical-align: middle;
    font-size: .875em
}

.pure-form-message {
    display: block;
    color: #666;
    font-size: .875em
}

@media only screen and (max-width :480px) {
    .pure-form button[type=submit] {
        margin: .7em 0 0
    }
    .pure-form input:not ([type] ),.pure-form input[type=number],.pure-form input[type=search],.pure-form input[type=text],.pure-form input[type=password],.pure-form input[type=email],.pure-form input[type=url],.pure-form input[type=date],.pure-form input[type=month],.pure-form input[type=time],.pure-form input[type=datetime],.pure-form input[type=datetime-local],.pure-form input[type=week],.pure-form input[type=tel],.pure-form input[type=color],.pure-form label
    {
        margin-bottom: .3em;
        display: block
    }
    .pure-group input:not ([type] ),.pure-group input[type=number],.pure-group input[type=search],.pure-group input[type=text],.pure-group input[type=password],.pure-group input[type=email],.pure-group input[type=url],.pure-group input[type=date],.pure-group input[type=month],.pure-group input[type=time],.pure-group input[type=datetime],.pure-group input[type=datetime-local],.pure-group input[type=week],.pure-group input[type=tel],.pure-group input[type=color]
    {
        margin-bottom: 0
    }
    .pure-form-aligned .pure-control-group label {
        margin-bottom: .3em;
        text-align: left;
        display: block;
        width: 100%
    }
    .pure-form-aligned .pure-controls {
        margin: 1.5em 0 0
    }
    .pure-form .pure-help-inline,.pure-form-message,.pure-form-message-inline
    {
        display: block;
        font-size: .75em;
        padding: .2em 0 .8em
    }
}

.pure-menu {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box
}

.pure-menu-fixed {
    position: fixed;
    left: 0;
    top: 0;
    z-index: 3
}

.pure-menu-item,.pure-menu-list {
    position: relative
}

.pure-menu-list {
    list-style: none;
    margin: 0;
    padding: 0
}

.pure-menu-item {
    padding: 0;
    margin: 0;
    height: 100%
}

.pure-menu-heading,.pure-menu-link {
    display: block;
    text-decoration: none;
    white-space: nowrap
}

.pure-menu-horizontal {
    width: 100%;
    white-space: nowrap
}

.pure-menu-horizontal .pure-menu-list {
    display: inline-block
}

.pure-menu-horizontal .pure-menu-heading,.pure-menu-horizontal .pure-menu-item,.pure-menu-horizontal .pure-menu-separator
{
    display: inline-block;
    zoom: 1;
    vertical-align: middle
}

.pure-menu-item .pure-menu-item {
    display: block
}

.pure-menu-children {
    display: none;
    position: absolute;
    left: 100%;
    top: 0;
    margin: 0;
    padding: 0;
    z-index: 3
}

.pure-menu-horizontal .pure-menu-children {
    left: 0;
    top: auto;
    width: inherit
}

.pure-menu-active>.pure-menu-children,.pure-menu-allow-hover:hover>.pure-menu-children
{
    display: block;
    position: absolute
}

.pure-menu-has-children>.pure-menu-link:after {
    padding-left: .5em;
    content: "\25B8";
    font-size: small
}

.pure-menu-horizontal .pure-menu-has-children>.pure-menu-link:after {
    content: "\25BE"
}

.pure-menu-scrollable {
    overflow-y: scroll;
    overflow-x: hidden
}

.pure-menu-scrollable .pure-menu-list {
    display: block
}

.pure-menu-horizontal.pure-menu-scrollable .pure-menu-list {
    display: inline-block
}

.pure-menu-horizontal.pure-menu-scrollable {
    white-space: nowrap;
    overflow-y: hidden;
    overflow-x: auto;
    -ms-overflow-style: none;
    -webkit-overflow-scrolling: touch;
    padding: .5em 0
}

.pure-menu-horizontal.pure-menu-scrollable::-webkit-scrollbar {
    display: none
}

.pure-menu-separator {
    background-color: #ccc;
    height: 1px;
    margin: .3em 0
}

.pure-menu-horizontal .pure-menu-separator {
    width: 1px;
    height: 1.3em;
    margin: 0 .3em
}

.pure-menu-heading {
    text-transform: uppercase;
    color: #565d64
}

.pure-menu-link {
    color: #777
}

.pure-menu-children {
    background-color: #fff
}

.pure-menu-disabled,.pure-menu-heading,.pure-menu-link {
    padding: .5em 1em
}

.pure-menu-disabled {
    opacity: .5
}

.pure-menu-disabled .pure-menu-link:hover {
    background-color: transparent
}

.pure-menu-active>.pure-menu-link,.pure-menu-link:focus,.pure-menu-link:hover
{
    background-color: #eee
}

.pure-menu-selected .pure-menu-link,.pure-menu-selected .pure-menu-link:visited
{
    color: #000
}

.pure-table {
    empty-cells: show;
    border: 1px solid #cbcbcb
}

.pure-table caption {
    color: #000;
    font: italic 85%/1 arial, sans-serif;
    padding: 1em 0;
    text-align: center
}

.pure-table td,.pure-table th {
    border-left: 1px solid #cbcbcb;
    border-width: 0 0 0 1px;
    font-size: inherit;
    margin: 0;
    overflow: visible;
    padding: .5em 1em
}

.pure-table td:first-child,.pure-table th:first-child {
    border-left-width: 0
}

.pure-table thead {
    background-color: #e0e0e0;
    color: #000;
    text-align: left;
    vertical-align: bottom
}

.pure-table td {
    background-color: transparent
}

.pure-table-odd td,.pure-table-striped tr:nth-child(2n-1) td {
    background-color: #f2f2f2
}

.pure-table-bordered td {
    border-bottom: 1px solid #cbcbcb
}

.pure-table-bordered tbody>tr:last-child>td {
    border-bottom-width: 0
}

.pure-table-horizontal td,.pure-table-horizontal th {
    border-width: 0 0 1px;
    border-bottom: 1px solid #cbcbcb
}

.pure-table-horizontal tbody>tr:last-child>td {
    border-bottom-width: 0
}

html {
    -ms-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%;
    line-height: 1.6
}

.article .audio_area,.article .qqmusic_area {
    text-decoration: none;
    -ms-text-size-adjust: none;
    font-weight: 400
}

.article .audio_area,.article .preview_group,.article .qqmusic_area {
    -webkit-text-size-adjust: none;
    text-size-adjust: none
}

body {
    background-color: #F9F9F9;
    -webkit-touch-callout: none;
    font-family: "Helvetica Neue", Helvetica, "Hiragino Sans GB",
    "Microsoft YaHei", Arial, sans-serif;
    line-height: inherit
}

main {
    padding-left: 3%;
    padding-right: 3%;
    margin-top: 15px
}

#firstShare {
    position: fixed;
    left: 0;
    top: 0;
    bottom: 0;
    right: 0;
    background: rgba(0, 0, 0, .7);
    z-index: 1003
}

#firstShare .btnTip {
    position: fixed;
    bottom: 60px;
    left: 0;
    right: 0;
    width: 92%;
    text-align: center
}

#firstShare .btnTip img {
    width: 100%;
    display: block;
    margin: 0 auto
}

#firstShare .Iknow {
    text-align: center;
    margin-top: 53%
}

#firstShare .Iknow img {
    width: 170px
}

#firstShare .shareTip {
    position: fixed;
    right: 5px;
    top: 15px;
    border-radius: 4px;
    background-color: #fff;
    padding: 8px;
    font-size: 12px;
    line-height: 20px
}

#firstShare .shareTip p {
    margin: 0
}

#firstShare .shareTip p:after {
    width: 0;
    content: ' ';
    height: 0;
    border-left: 5px solid transparent;
    border-right: 5px solid transparent;
    border-bottom: 5px solid #fff;
    position: absolute;
    right: 20px;
    top: -5px
}

.articles main {
    margin-top: 60px;
    margin-bottom: 50px;
    padding-bottom: 10px
}

.articles .articleList {
    will-change: transform
}

.articles .articleList .title {
    font-size: 14px;
    height: 20px;
    line-height: 20px;
    padding: 5px 0;
    text-indent: 10px;
    margin-bottom: 5px;
    color: #323232;
    text-align:center;
}

.articles .articleList .title .moreShare {
    font-size: 14px;
    float: right
}

.articles .articleList .loading,.articles .articleList .noData {
    font-size: 12px;
    text-align: center
}

.articles .articleList .line {
    border: 0;
    display: block;
    border-bottom: solid 1px #f0f0f0
}

.articles .articleList .loading {
    background-color: rgba(0, 0, 0, .8);
    color: #fff;
    border-radius: 16px;
    box-shadow: 0 0 2px #333;
    display: block;
    line-height: 25px;
    height: 25px;
    position: fixed;
    width: 80px;
    bottom: 55px;
    left: 50%;
    margin-left: -40px;
    right: 0;
    z-index: 10000
}

.articles .articleList ul {
    padding: 0;
    margin: 0;
    list-style: none
}

.articles .articleList ul li {
    border-bottom: solid 1px #f0f0f0;
    transition-duration: .3s;
    -webkit-transition-duration: .3s;
    -webkit-transform: translate(0, 0) translateZ(0);
    transform: translate(0, 0) translateZ(0)
}

.articles .articleList ul li:last-child {
    border: none
}

.articles .articleList ul li a {
    display: block;
    margin: 4px 0;
    text-decoration: none;
    position: relative
}

.articles .articleList ul li a .img {
    position: relative;
    width: 85px;
    height: 65px;
    float: left;
    margin-right: 8px
}

.articles .articleList ul li a .img img {
    display: block;
    width: 100%;
    height: 100%;
    -webkit-background-size: cover;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    overflow: hidden
}

.articles .articleList ul li a .option {
    display: block;
    width: 130px;
    position: absolute;
    top: 0;
    right: -130px;
    bottom: 0;
    margin-right: -3.1%
}

.articles .articleList ul li a .option span {
    width: 50%;
    display: block;
    text-align: center;
    line-height: 93px;
    height: 93px;
    color: #fff;
    font-size: 14px;
    margin-top: -14px;
    float: left
}

.articles .articleList ul li a .option span.del {
    background: #ccc
}

.articles .articleList ul li a .option span.share {
    background: #ff5959
}

.articles .articleList ul li a .articleInfo {
    overflow: hidden
}

.articles .articleList ul li a .articleInfo h3 {
    margin: 0;
    padding: 0;

    font-size: 15px;
    line-height: 20px;
    font-weight: 400;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    -webkit-box-flex: 1;
    overflow: hidden;
    color: #555
}

.articles .articleList ul li a .articleInfo h3:visited {
    color: #a5a5a5 !important
}

.articles .articleList ul li a .articleInfo p {
    color: #666666;
    margin: 13px 0 0;
    padding: 0;
    height: 14px;
    line-height: 14px;
    font-size: 12px;
    overflow: hidden
}

.articles .articleList ul li a .articleInfo p .pv {
    float: left
}

.articles .articleList ul li a .articleInfo p .createTime,.articles .articleList ul li a .articleInfo p .share
{
    float: right !important
}

.articles .articleList ul li a .articleInfo p .share {
    left: 0;
    top: 0;
    position: absolute;
    border-radius: 0 !important;
    margin-top: 0 !important
}

#clickMe,footer {
    position: fixed;
    text-align: center
}

.articles .articleList ul li a .articleInfo p .lable {
    float: left;
    color: #fff;
    font-size: 12px;
    background: #000;
    border-radius: 0;
    height: 14px;
    line-height: 14px;
    padding: 0 4px;
    margin-right: 4px;
    vertical-align: -webkit-baseline-middle
}

#clickMe {
    display: block;
    font-size: 12px;
    height: 14px;
    padding: 2px 3px;
    line-height: 14px;
    text-decoration: none;
    background-color: rgba(0, 0, 0, .4);
    color: #fff;
    right: 2px;
    bottom: 2px;
    z-index: 10000
}

footer {
    bottom: 0;
    left: 0;
    right: 0;
    padding: .5em .65em;
    background-color: rgba(255, 255, 255, .9);
    box-shadow: 0 0 1px #ccc;
    z-index: 1004
}

.advertItems,.advertItems .advert.style-3 {
    position: relative
}

footer .btnList {
    list-style: none;
    margin: 0;
    padding: 0;
    height: 37px;
    overflow: hidden
}

footer .btnList li {
    display: inline-block;
    width: 19%;
    text-align: center;
    font-size: 12px;
    color: rgba(0, 0, 0, .8);
    margin: 0 2%;
    vertical-align: middle
}

footer .btnList li a {
    display: block;
    text-decoration: none;
    color: #505050
}

footer .btnList li a.active {
    color: #ff4c4c
}

footer .btnList li .extract {
    width: 100%;
    height: 100%
}

footer .btnList li i {
    margin: 0 auto 5px;
    display: block;
    font-size: 16px
}

footer .btnList li i.icon-plus {
    background-color: rgba(255, 76, 76, .7);
    color: #fff;
    display: inline-block;
    text-align: center;
    width: 35px;
    height: 35px;
    border-radius: 100%;
    line-height: 35px
}

.advertItems {
    margin-top: 15px
}

/* .advertItems .advert {
    height: 80px;
    background-color: #fff;
    box-shadow: 0 0 1px #aaa;
    width: 100%;
    overflow: hidden
} */
.advertItems  .style-1 {
    box-shadow: 0 0 1px #aaa;
    width: 100%;
    overflow: hidden
}
.advertItems  .style-2 {
    height: 80px;
    box-shadow: 0 0 1px #aaa;
    width: 100%;
    overflow: hidden
}
.advertItems  .style-3 {
    height: 80px;
    box-shadow: 0 0 1px #aaa;
    width: 100%;
    overflow: hidden
}
.advertItems  .style-4 {
    height: 80px;
    box-shadow: 0 0 1px #aaa;
    width: 100%;
    overflow: hidden
}

.advertItems .advert.style-3 .avatar {
    width: 56px;
    height: 56px;
    line-height: 56px;
    float: left;
    background-color: #b3b3b3;
    margin: 12px 10px;
    overflow: hidden
}

.advertItems .advert.style-3 .avatar:empty:after {
    content: '暂无图片';
    display: block;
    width: 100%;
    height: 100%;
    text-align: center;
    color: #fff;
    font-size: 12px
}

.advertItems .advert.style-3 .avatar img {
    background-position: center;
    -webkit-background-size: cover;
    background-size: cover;
    background-repeat: no-repeat;
    height: 56px;
    display: block;
    border: none;
    width: 100%
}

.advertItems .advert.style-1,.advertItems .advert.style-1 img {
    -webkit-background-size: cover;
    background-position: center;
    background-repeat: no-repeat
}

.advertItems .advert.style-3 .advertInfo {
    margin-right: 10px;
    display: table;
    height: 100%
}

.advertItems .advert.style-3 .advertInfo .table-cell {
    display: table-cell;
    vertical-align: middle
}

.advertItems .advert.style-3 .advertInfo .table-cell h4 {
    margin: 0 0 7px;
    font-size: 14px;
    height: 16px;
    line-height: 16px;
    overflow: hidden;
    color: #333;
    font-weight: 400
}

.advertItems .advert.style-3 .advertInfo .table-cell p {
    margin: 0;
    font-size: 12px;
    max-height: 28px;
    line-height: 14px;
    text-align: justify;
    overflow: hidden;
    color: #666
}

.advertItems .advert.style-3 span {
    position: absolute;
    font-size: 12px;
    padding: 1px 2px;
    right: 2px;
    bottom: 2px;
    border-radius: 0;
    border: 1px solid #60cc66;
    color: #60cc66;
    height: 12px;
    line-height: 12px;
    display: block;
    background-color: #fff
}

.advertItems .advert.style-1 {
    background-size: cover;
    text-align: center;
    max-height: 6.7em;
    min-height: 80px;
}

.advertItems .advert.style-1:empty:after {
    content: '暂无图片';
    display: block;
    width: 100%;
    height: 100%;
    line-height: 80px;
    text-align: center;
    color: #aaa
}

.advertItems .advert.style-1 img {
    background-size: cover;
    height: 100%;
    display: block;
    border: none;
    width: 100%
}


.advertItems .advert.style-2 {
    position: relative
}

.advertItems .advert.style-2 .avatar {
    width: 56px;
    height: 56px;
    line-height: 56px;
    float: left;
    border-radius: 100%;
    background-color: #ccc;
    margin: 12px 10px;
    overflow: hidden
}

.advertItems .advert.style-2 .avatar:empty:after {
    content: 'LOGO';
    display: block;
    width: 100%;
    height: 100%;
    text-align: center;
    font-size: 14px;
    color: #fff
}

.advertItems .advert.style-2 .avatar img {
    background-position: center;
    -webkit-background-size: cover;
    background-size: cover;
    background-repeat: no-repeat;
    height: 56px;
    display: block;
    border: none;
    width: 100%
}

.advertItems .advert.style-2 .advertInfo {
    margin-right: 64px;
    display: table;
    height: 100%;
    text-align: left;
}

.advertItems .advert.style-2 .advertInfo .table-cell {
    display: table-cell;
    vertical-align: middle
}

.advertItems .advert.style-2 .advertInfo .table-cell h4 {
    margin: 0 0 7px;
    font-size: 14px;
    height: 16px;
    line-height: 16px;
    overflow: hidden;
    color: #666;
    font-weight: 400
}

.advertItems .advert.style-2 .advertInfo .table-cell p {
    margin: 0;
    font-size: 12px;
    max-height: 28px;
    line-height: 14px;
    text-align: justify;
    overflow: hidden;
    color: #666
}

.advertItems .advert.style-2 .call {
    padding: 0 3px
}

.advertItems .advert.style-2 .call i {
    background-image: url(/images/tel.png);
    width: 15px;
    height: 15px;
    background-size: 90%;
    background-repeat: no-repeat;
    display: inline-block;
    float: left;
    margin-top: 4px;
    margin-left: 2px
}

.advertItems .advert.style-2 .call,.advertItems .advert.style-2 .focus {
    position: absolute;
    top: 50%;
    margin-top: -12px;
    right: 10px;
    text-decoration: none;
    display: block;
    width: 42px;
    text-align: center;
    height: 22px;
    border: 1px solid #60cc66;
    border-radius: 4px;
    font-size: 12px;
    line-height: 22px;
    color: #60cc66
}

.advertItems .qrcodeBox {
    position: absolute;
    width: 80%;
    left: 50%;
    right: 0;
    margin-left: -43%;
    background: rgba(0, 0, 0, .85);
    padding: 10px;
    border-radius: 4px;
    box-shadow: 0 0 3px #333;
    z-index: 10000
}

.advertItems .qrcodeBox.hide {
    display: none
}

.advertItems .qrcodeBox.bottom {
    bottom: -135px
}

.advertItems .qrcodeBox.top {
    top: 100px
}

.advertItems .qrcodeBox .title {
    width: 100%;
    color: #fff;
    text-align: center;
    position: relative
}

.advertItems .qrcodeBox .title p {
    font-size: 16px;
    margin: 0;
    padding: 0 0 10px;
    text-align: center;
    font-weight: 400
}

.advertItems .qrcodeBox .title .close {
    position: absolute;
    width: 26px;
    height: 26px;
    text-align: center;
    line-height: 26px;
    font-size: 12px;
    top: -22px;
    right: -22px;
    color: #000;
    background: #fff;
    border-radius: 100%;
    box-shadow: 0 0 3px #888
}

.advertItems .qrcodeBox img {
    width: 100% !important;
    display: block
}

.article h1,.article h2,.article h3,.article h4,.article h5,.article h6
{
    font-weight: 400;
    font-size: 16px
}

.article * {
    margin: 0;
    padding: 0
}

.article a {
    color: #607fa6;
    text-decoration: none
}

.article .expand {
    display: block;
    height: 40px;
    line-height: 40px;
    text-align: center;
    z-index: 99;
    position: relative;
    font-size: 14px;
    background: #fbfbfb;
    margin-bottom: 30px
}

.article .expand span {
    font-size: 12px;
    display: inline-block;
    transform: translateY(3px);
    -ms-transform: translateY(3px);
    -moz-transform: translateY(3px);
    -webkit-transform: translateY(3px);
    -o-transform: translateY(3px)
}

.article .article-info {
    margin-bottom: 15px;
    font-size: 15px;
    color: #b1b1b1;
    line-height: 24px;
    height: 24px
}

.article .article-info .time {
    float: left;
    margin-left: 5px
}

.article .article-info a {
    margin-left: 20px;
}

.article .article-info .more {
    float: left;
    font-size: 14px;
    display: block
}

.article .article-info .more span {
    display: block;
    max-width: 140px;
    height: 24px;
    overflow: hidden;
    float: left;
    font-size: 17px
}

.article .article-info .more i {
    color: #FBAF20;
    width: 22px;
    height: 22px;
    background-position: center center;
    background-repeat: no-repeat;
    -webkit-background-size: cover;
    background-size: cover;
    overflow: hidden;
    border-radius: 100%;
    float: left;
    margin: 1px 6px
}

.article .newsList {
    box-shadow: 0 0 1px #aaa;
    overflow: hidden;
    margin: 15px 0;
    display: none
}

.article .newsList ul {
    color: #666;
    padding: 0 10px
}

.article .newsList ul li {
    height: 40px;
    line-height: 40px;
    font-size: 14px;
    border-bottom: solid 1px #e6e6e6
}

.article .newsList ul li:last-child {
    border: none
}

.article .newsList ul li a {
    display: block;
    width: 100%;
    color: #323232;
    overflow: hidden;
    text-decoration: none
}

.article .newsList ul li a span {
    color: #666;
    font-size: 18px;
    margin-right: 5px
}

.article .newsList ul li a i {
    font-style: normal;
    color: #607fa6
}

.article .recomArticleList {
    display: none !important;
    background: #fff;
    padding: 5px 3%;
    width: 100%;
    margin-left: -3%;
    margin-top: 10px;
    box-shadow: 0 0 1px #e4e3e3;
    position: relative
}

.article .recomArticleList ul li a {
    margin: 8px 0
}

.article .recomArticleList ul li a .img {
    height: 60px;
    width: 78px
}

.article .recomArticleList ul li a .articleInfo {
    height: 60px
}

.article .recomArticleList ul li a .articleInfo h3 {
    font-size: 14px;
    line-height: 22px;
    height: 45px
}

.article .copyRight {
    overflow: hidden;
    font-size: 15px;
    color: #8c8c8c;
    margin-bottom: 35px
}
.c_right{
    float:right;
}


.article .copyRight a.left {
    float: left
}

.article .copyRight a {
    float: right
}

.article .adWords {
    text-align: center;
    font-size: 12px;
    line-height: 25px;
    height: 25px;
    margin-bottom: 10px;
    margin-top: 10px;
    overflow: hidden;
}

.article .advertItems {
    margin: 3% 0;
    position: relative
}
.favourWrapper{
    padding-left: 10px;
}
.favour-icon, .favour-icon-active {
    background: transparent url(/images/favour.png) no-repeat 0 0;
    width: 14px;
    height: 14px;
    vertical-align: middle;
    display: inline-block;
    -webkit-background-size: 100% auto;
    background-size: 100% auto;
    margin-top: -4px;
    margin-right: 2px;
}

.article .advertItems:after {
    position: absolute;
    height: 0;
    border-bottom: dashed 1px #eee;
    bottom: 0;
    margin-bottom: -10px
}

.article img[height] {
    height: auto !important
}

.article .rich_media_inner {
    font-size: 16px;
    word-wrap: break-word;
    -webkit-hyphens: auto;
    -ms-hyphens: auto;
    hyphens: auto
}

.article .rich_media_area_primary {
    position: relative;
    padding: 20px 15px 15px;
    background-color: #fff
}

.article .rich_media_area_primary:before {
    content: " ";
    position: absolute;
    left: 0;
    width: 100%;
    height: 1px;
    border-top: 1px solid #e5e5e5;
    -webkit-transform-origin: 0 0;
    transform-origin: 0 0;
    -webkit-transform: scaleY(.5);
    transform: scaleY(.5);
    top: auto;
    bottom: -2px
}

.article .rich_media_area_primary .original_img_wrp {
    display: inline-block;
    font-size: 0
}

.article .rich_media_area_primary .original_img_wrp .tips_global {
    display: block;
    margin-top: .5em;
    font-size: 14px;
    text-align: right;
    width: auto;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    word-wrap: normal
}

.article .rich_media_area_extra {
    padding: 0 15px
}

.article .rich_media_title {
    margin-bottom: 15px;
    line-height: 1.4;
    font-weight: 400;
    font-size: 24px;
    text-align: justify;
    padding-top: 4px
}

.article .tc,.article caption {
    text-align: center
}

.article .rich_media_meta_list {
    margin-bottom: 18px;
    line-height: 20px;
    font-size: 0
}

.article .rich_media_meta_list em {
    font-style: normal
}

.article .rich_media_meta {
    display: inline-block;
    vertical-align: middle;
    margin-right: 8px;
    margin-bottom: 10px;
    font-size: 16px
}

.article .meta_original_tag {
    display: inline-block;
    vertical-align: middle;
    padding: 1px .5em;
    border: 1px solid #9e9e9e;
    color: #8c8c8c;
    border-radius: 20% 50%;
    -moz-border-radius: 20% 50%;
    -webkit-border-radius: 20% 50%;
    font-size: 15px;
    line-height: 1.1
}

.article .meta_enterprise_tag img {
    width: 30px;
    height: 30px !important;
    display: block;
    position: relative;
    margin-top: -3px;
    border: 0
}

.article .rich_media_meta_text {
    color: #8c8c8c
}

.article span.rich_media_meta_nickname {
    display: none
}

.article .rich_media_thumb_wrp {
    margin-bottom: 6px
}

.article .rich_media_thumb_wrp .original_img_wrp {
    display: block
}

.article .rich_media_thumb {
    display: block;
    width: 100%
}

.article .rich_media_content {
    overflow: hidden;
    color: #3e3e3e
}

.article .rich_media_content.mini {
    position: relative
}

.article .rich_media_content.mini:after {
    height: 50px;
    width: 100%;
    content: ' ';
    background: -moz-linear-gradient(top, rgba(251, 251, 251, 0), #fbfbfb);
    background: -webkit-gradient(linear, top, from(rgba(251, 251, 251, 0)),
        to(#fbfbfb));
    background: -webkit-linear-gradient(top, rgba(251, 251, 251, 0), #fbfbfb);
    background: -o-linear-gradient(top, rgba(251, 251, 251, 0), #fbfbfb);
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0
}

.article .rich_media_content * {
    max-width: 100% !important;
    box-sizing: border-box !important;
    -webkit-box-sizing: border-box !important;
    word-wrap: break-word !important
}

.article .rich_media_content p {
    clear: both;
    min-height: 1em !important;
    /* white-space: pre-wrap */
}

.article #article img {
    max-width: 100%;
    display: inline-block;
    margin: auto;
    border: 0
}

.article .rich_media_content em {
    font-style: italic
}

.article .rich_media_content fieldset {
    min-width: 0
}

.article .rich_media_content .list-paddingleft-2 {
    padding-left: 30px
}

.article .rich_media_content blockquote {
    margin: 0;
    padding-left: 10px;
    border-left: 3px solid #dbdbdb
}

@media ( min-device-width :414px) and (max-device-width:736px) and
(-webkit-min-device-pixel-ratio:3) {
    .article .mm_appmsg .rich_media_title {
        font-size: 24px
    }
}

.article .radius_avatar {
    display: inline-block;
    background-color: #fff;
    padding: 3px;
    border-radius: 50%;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    overflow: hidden;
    vertical-align: middle
}

.article .radius_avatar img {
    width: 100%;
    height: 100%;
    border-radius: 50%;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    background-color: #eee
}

.article .cell {
    padding: .8em 0;
    display: block;
    position: relative
}

.article .cell_bd,.article .cell_ft,.article .cell_hd {
    display: table-cell;
    vertical-align: middle;
    word-wrap: break-word;
    word-break: break-all;
    white-space: nowrap
}

.article .cell_primary {
    width: 2000px;
    white-space: normal
}

.article .original_tool_area {
    display: block;
    padding: .75em 1em 0;
    -webkit-tap-highlight-color: transparent;
    color: #3e3e3e;
    border: 1px solid #eaeaea;
    margin: 20px 0
}

.article .original_tool_area .tips_global {
    position: relative;
    padding-bottom: .5em;
    font-size: 15px
}

.article .original_tool_area .tips_global:after {
    content: " ";
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    height: 1px;
    border-bottom: 1px solid #dbdbdb;
    -webkit-transform-origin: 0 100%;
    transform-origin: 0 100%;
    -webkit-transform: scaleY(.5);
    transform: scaleY(.5)
}

.article .original_tool_area .radius_avatar {
    width: 27px;
    height: 27px;
    padding: 0;
    margin-right: .5em
}

.article .original_tool_area .radius_avatar img {
    height: 100% !important
}

.article .original_tool_area .icon_access:before {
    content: " ";
    display: inline-block;
    height: 8px;
    width: 8px;
    border-width: 1px 1px 0 0;
    border-color: #cbcad0;
    border-style: solid;
    transform: matrix(.71, .71, -.71, .71, 0, 0);
    -ms-transform: matrix(.71, .71, -.71, .71, 0, 0);
    -webkit-transform: matrix(.71, .71, -.71, .71, 0, 0);
    position: relative;
    top: -2px;
    top: -1px
}

.article .selectTdClass {
    background-color: #edf5fa !important
}

.article table.noBorderTable caption,.article table.noBorderTable td,.article table.noBorderTable th
{
    border: 1px dashed #ddd !important
}

.article table {
    margin-bottom: 10px;
    display: table;
    width: 100% !important
}

.article td,.article th {
    word-wrap: break-word;
    word-break: break-all;
    padding: 5px 10px;
    border: 1px solid #DDD
}

.article caption {
    border: 1px dashed #DDD;
    border-bottom: 0;
    padding: 3px
}

.article th {
    border-top: 2px solid #BBB;
    background: #f7f7f7
}

.article .ue-table-interlace-color-single {
    background-color: #fcfcfc
}

.article .ue-table-interlace-color-double {
    background-color: #f7faff
}

.article .res_iframe,.article .vote_iframe {
    display: block;
    width: 100%;
    background-color: transparent;
    border: 0
}

.article td p {
    margin: 0;
    padding: 0
}

.article .vote_area {
    display: block;
    position: relative;
    margin: 14px 0;
    white-space: normal !important
}

.article .vote_iframe {
    height: 100%
}

.article form {
    display: none !important
}

@media screen and (min-width:0) and (min-resolution:72dpi) {
    .article .rich_media_content table {
        table-layout: fixed !important
    }
    .article .rich_media_content td,.article .rich_media_content th {
        width: auto !important
    }
}

.article .tl {
    text-align: left
}

.article .tr {
    text-align: right
}

.article .tips_global {
    color: #8c8c8c
}

.article .rich_split_tips {
    margin: 20px 0;
    min-height: 24px
}

.article .rich_media_tool_tips {
    margin-bottom: 8px
}

.article .rich_media_tool {
    overflow: hidden;
    padding-top: 15px;
    line-height: 32px
}

.article .rich_media_tool .meta_primary {
    float: left;
    margin-right: 10px
}

.article .rich_media_tool .meta_extra {
    float: right;
    margin-left: 10px
}

.article .rich_media_tool .meta_praise {
    margin-right: 0;
    margin-left: 8px
}

.article .media_tool_meta i {
    vertical-align: 0;
    position: relative;
    top: 1px;
    margin-right: 3px
}

.article .meta_praise {
    -webkit-tap-highlight-color: transparent;
    outline: 0;
    min-width: 3.5em
}

.article .meta_praise .praise_num {
    display: inline-block;
    vertical-align: top
}

.article .icon_praise_gray {
    background:
    url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAA+CAYAAAA1dwvuAAAACXBIWXMAAA7EAAAOxAGVKw4bAAACd0lEQVRYhe2XMWhUMRjHfycdpDg4iJN26CQih4NUlFIc3iTasaAO+iZBnorIId2CDg6PLqWDXSy0p28TJ6ejILgoKiLFSeRcnASLnDf2HPKll8b3ah5NQPB+cHzJl0v+73J5Sf6NwWCAD6kqxoEV4BywCTwA2j59V9QlxrxUNJeBOSkfBtaAHvDcp/O+GkJHJd4H7kr5nm/nOkJHJH4FHkv5WAyhUxLfAgelvBlUKFXFBNCU6oYl+j6oEHohADwFtoDTUn8dTChVxX7gjlSfSJyS+CaYEDCPXs4d4IXkzDR+8BWqfI9SVUyil/ENST20ml8BF4Afu4z9HT3V80B/TAY9CxTABNAHxp1Oj4B1q34dWAamGa5Al0PALfSs3TS/aE1EcERWgQXgozPIN+Ai6O2ljFQVM8BLZJqN0KTEhgj9kvrViqf1wYz5BcoXQ38Pg9uckfiuSigU0xLXowmlqpgCjgNd4FM0IeCKxGcmEUtoRqLZScILpaqYA06iN9/tTTfGLzKvxLKdDCqUquIEcB59xK9GE2J4xLeBn3ZD1abaq/sQqSpmgWvo82rBbTdCPeAA4N69/noXS1XhphaBz27SPPVtapz/FXSBFsNDcgcN3wvkiBEjRoSndAtqLXXKvuvtYfMs+SP3T3tYm6ge1iaqh7UJ62HRTqNZko/mYV3CeVjA9rAuUTxsGd4edrcX1vWwddn2sHmWaA/bWuq4HnYLff3aC7U8bAiaMPyPJp3GhnxCUOlhQxPdwxrieViLbp4lUT2sIbqHNcTzsBYbeZZE9bCGeB7WIrqHNbTzLNnhYWMIlXpYI9Rz8gM8/GsFi3mW/Ace9jf8QZwIX5o4uQAAAABJRU5ErkJggg==)
    no-repeat;
    width: 13px;
    height: 13px;
    vertical-align: middle;
    display: inline-block;
    -webkit-background-size: 100% auto;
    background-size: 100% auto
}

.article .icon_praise_gray.praised,.article .praised .icon_praise_gray {
    background-position: 0 -18px
}

.article .rich_tips {
    margin-top: 25px;
    margin-bottom: 0;
    min-height: 24px;
    text-align: center
}

.article .rich_tips .tips {
    display: inline-block;
    vertical-align: middle
}

.article .rich_tips .rich_icon,.article .rich_tips .tips {
    vertical-align: middle
}

.article .rich_tips .rich_icon {
    margin-top: -3px 5px 0 0
}

.article .rich_tips.with_line {
    border-top: 1px dotted #e1e1e1;
    line-height: 16px
}

.article .rich_tips.with_line .tips {
    position: relative;
    background-color: #f3f3f3;
    top: -11px;
    padding-left: .35em;
    padding-right: .35em
}

.article .title_tips .tips {
    color: #868686;
    font-size: 16px
}

.article .loading_tips {
    margin: 36px 0 20px
}

.article .title_bottom_tips {
    margin-top: -10px
}

.article .icon_arrow_gray {
    width: 7px
}

.article .icon_loading_white {
    width: 16px
}

.article .icon_loading_white.icon_before {
    margin-right: 1em
}

.article .icon_loading_white.icon_after {
    margin-left: 1em
}

.article .btn {
    display: block;
    padding-left: 14px;
    padding-right: 14px;
    font-size: 18px;
    text-align: center;
    text-decoration: none;
    border-radius: 5px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    color: #fff;
    line-height: 42px;
    -webkit-tap-highlight-color: rgba(255, 255, 255, 0)
}

.article .access_area,.article .frm_textarea,.article .icon_qqmusic_switch,.article .reward_access,.article .reward_user_avatar.readmore
{
    -webkit-tap-highlight-color: transparent
}

.article .btn.btn_inline {
    display: inline-block
}

.article .btn_primary {
    background-color: #04be02
}

.article .btn_primary:not (.btn_disabled ):visited {
    color: #fff
}

.article .btn_primary:not (.btn_disabled ):active {
    color: rgba(255, 255, 255, .4);
    background-color: #039702
}

.article .btn_disabled {
    color: rgba(255, 255, 255, .6)
}

.article .emotion_tool {
    position: relative;
    overflow: hidden
}

.article .pic_emotion_switch_wrp {
    margin-left: 15px;
    margin-bottom: 6px;
    display: inline-block;
    font-size: 0
}

.article .pic_emotion_switch_wrp img {
    width: 35px;
    display: block
}

.article .pic_emotion_switch_wrp .pic_active,.article .pic_emotion_switch_wrp:active .pic_default
{
    display: none
}

.article .discuss_container.editing .discuss_btn_wrp,.article .discuss_container.editing .frm_append.counter,.article .frm_textarea,.article .pic_emotion_switch_wrp:active .pic_active
{
    display: block
}

.article .wx_poptips {
    position: fixed;
    z-index: 3;
    width: 120px;
    min-height: 120px;
    top: 180px;
    left: 50%;
    margin-left: -60px;
    background: rgba(40, 40, 40, .5) !important;
    filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,
        startColorstr='#80282828', endcolorstr='#80282828');
    text-align: center;
    border-radius: 5px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    color: #fff
}

.article .wx_poptips .icon_toast {
    width: 53px;
    margin: 15px 0 0
}

.article .wx_poptips .toast_content {
    margin: 0 0 15px
}

.article .discuss_container .rich_media_title {
    font-size: 18px
}

.article .discuss_container .discuss_message {
    word-wrap: break-word;
    -webkit-hyphens: auto;
    -ms-hyphens: auto;
    hyphens: auto
}

.article .discuss_container.disabled .btn_discuss {
    color: #60f05f
}

.article .discuss_container.access .discuss_container_inner {
    padding: 15px 15px 0
}

.article .discuss_container.editing .discuss_container_inner {
    padding-bottom: 25px
}

.article .discuss_container.editing .frm_textarea_box_wrp {
    margin: 0 -15px
}

.article .discuss_container.editing .frm_textarea {
    height: 78px;
    -webkit-overflow-scrolling: touch
}

.article .discuss_container.editing .discuss_icon_tips {
    margin-top: 0;
    margin-bottom: -14px
}

.article .discuss_container.editing .discuss_title_line {
    margin-bottom: -20px
}

.article .discuss_container.warning .counter {
    color: #e15f63
}

.article .frm_textarea {
    width: 100%;
    background-color: transparent;
    border: 0;
    font-size: 14px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    height: 37px;
    padding: 10px 15px;
    resize: none;
    outline: 0
}

.article .frm_textarea_box_wrp:after,.article .frm_textarea_box_wrp:before
{
    content: " ";
    width: 100%;
    height: 1px;
    border-top: 1px solid #e7e6e4;
    -webkit-transform-origin: 0 0;
    left: 0
}

.article .frm_textarea_box_wrp {
    position: relative
}

.article .frm_textarea_box_wrp:before {
    position: absolute;
    transform-origin: 0 0;
    -webkit-transform: scaleY(.5);
    transform: scaleY(.5);
    top: -1px
}

.article .frm_textarea_box_wrp:after {
    position: absolute;
    transform-origin: 0 0;
    -webkit-transform: scaleY(.5);
    transform: scaleY(.5);
    top: auto;
    bottom: -2px
}

.article .frm_textarea_box {
    display: block;
    background-color: #fff
}

.article .frm_append.counter {
    display: none;
    position: absolute;
    right: 8px;
    bottom: 8px;
    color: #a3a3a3;
    font-weight: 400;
    font-style: normal;
    font-size: 12px
}

.article .frm_append .current_num.warn {
    color: #f43631
}

.article .discuss_btn_wrp {
    display: none;
    margin-top: 20px;
    margin-bottom: 20px;
    text-align: right
}

.article .btn_discuss {
    padding-left: 1.5em;
    padding-right: 1.5em
}

.article .discuss_list {
    margin-top: -5px;
    padding-bottom: 20px;
    font-size: 16px
}

.article .discuss_item {
    position: relative;
    padding-left: 45px;
    margin-top: 26px
}

.article .discuss_item:after {
    content: "\200B";
    display: block;
    height: 0;
    clear: both
}

.article .discuss_item .user_info {
    min-height: 20px;
    overflow: hidden
}

.article .discuss_item .nickname {
    display: block;
    font-weight: 400;
    font-style: normal;
    color: #727272;
    width: 9em;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    word-wrap: normal
}

.article .discuss_item .avatar {
    position: absolute;
    left: 0;
    top: 3px;
    width: 35px;
    height: 35px;
    background-color: #ccc;
    vertical-align: top;
    margin-top: 0;
    border-radius: 2px;
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px
}

.article .discuss_item .discuss_message {
    color: #3e3e3e;
    line-height: 1.5
}

.article .discuss_item .discuss_extra_info {
    color: #8c8c8c;
    font-size: 12px
}

.article .discuss_item .discuss_extra_info a {
    margin-left: .5em
}

.article .discuss_item .discuss_status {
    color: #ff7a21;
    white-space: nowrap
}

.article .discuss_item .discuss_status i {
    font-style: normal;
    margin-right: 2px
}

.article .discuss_item .discuss_opr {
    float: right
}

.article .discuss_item .discuss_opr .meta_praise {
    display: inline-block;
    text-align: right;
    padding-top: 5px;
    margin-top: -5px
}

.article .discuss_item .discuss_del {
    margin-left: .5em
}

.article .discuss_icon_tips {
    margin-bottom: 20px
}

.article .discuss_icon_tips img {
    vertical-align: middle;
    margin-left: 3px;
    margin-top: -4px
}

.article .discuss_icon_tips .icon_edit {
    width: 12px
}

.article .discuss_icon_tips .icon_access {
    width: 13px
}

.article .reply_result {
    position: relative;
    margin-top: .5em;
    padding-top: .5em;
    padding-left: .4em
}

.article .reply_result:before {
    content: " ";
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 1px;
    border-top: 1px solid #dadada;
    -webkit-transform-origin: 0 0;
    transform-origin: 0 0;
    -webkit-transform: scaleY(.5);
    transform: scaleY(.5)
}

.article .reply_result .nickname {
    position: relative;
    overflow: visible
}

.article .reply_result .nickname:before {
    content: " ";
    position: absolute;
    left: -.4em;
    top: 50%;
    margin-top: -7px;
    width: 3px;
    height: 14px;
    background-color: #02bb00
}

.article .rich_tips.discuss_title_line {
    margin-top: 50px
}

.article .reward_area {
    padding: 38px 5% 20px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    margin: 0 auto
}

.article .reward_area_inner {
    margin: 0 auto;
    position: relative;
    left: 3px
}

.article .reward_access {
    display: inline-block;
    padding: 0 1.6em;
    line-height: 2;
    border-radius: 5px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    background-color: #dc5d4a;
    color: #fff;
    font-size: 16px
}

.article .reward_access:active {
    background-color: #be5041;
    color: #e69990
}

.article .reward_tips {
    margin-bottom: 5px
}

.article .reward_user_tips {
    margin-top: 1.4em
}

.article .reward_user_list {
    padding-top: .5em;
    overflow: hidden
}

.article .reward_user_avatar {
    display: inline-block;
    vertical-align: top;
    width: 28px;
    height: 28px;
    margin: 0 6px 6px 0
}

.article .reward_user_avatar img {
    width: 100%;
    height: 100% !important
}

.article .rich_media_extra {
    position: relative
}

.article .rich_media_extra img {
    vertical-align: middle;
    margin-top: -3px
}

.article .rich_media_extra .appmsg_banner {
    width: 100%
}

.article .rich_media_extra .ad_msg_mask {
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    text-align: center;
    line-height: 200px;
    background-color: #000;
    -moz-opacity: .2;
    -khtml-opacity: .2;
    opacity: .2
}

.article .mpda_bottom_container .rich_media_extra {
    padding-bottom: 15px
}

.article .btn_default.btn_line,.article .btn_primary.btn_line {
    background-color: #fff;
    color: #04be02;
    border: 1px solid #04be02;
    font-size: 15px
}

.article .rich_media_extra .extra_link {
    display: block;
    position: relative
}

.article .brand_logo {
    position: absolute;
    display: block;
    width: 24%;
    right: 1.54%;
    top: 0
}

.article .brand_logo img {
    width: 100%;
    vertical-align: top;
    max-height: 35px
}

.article .top_banner {
    background-color: #fff
}

.article .top_banner .rich_media_extra {
    padding: 15px 15px 20px
}

.article .top_banner .rich_media_extra .extra_link {
    position: relative;
    padding-bottom: 10px
}

.article .top_banner .rich_media_extra .extra_link:before {
    content: " ";
    position: absolute;
    left: 0;
    width: 100%;
    height: 1px;
    border-top: 1px solid #d6d6d6;
    -webkit-transform-origin: 0 0;
    transform-origin: 0 0;
    -webkit-transform: scaleY(.5);
    transform: scaleY(.5);
    top: auto;
    bottom: -2px
}

.article .top_banner .rich_media_extra .appmsg_banner:active,.article .top_banner .rich_media_extra .appmsg_banner:focus,.article .top_banner .rich_media_extra .extra_link:active,.article .top_banner .rich_media_extra .extra_link:focus
{
    border: 0;
    outline: 0
}

.article .top_banner .rich_media_extra .appmsg_banner {
    width: 100%;
    vertical-align: top;
    outline: 0
}

.article .top_banner .rich_media_extra .promotion_tag {
    height: 19px;
    line-height: 19px;
    width: 69px;
    background:
    url(http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/ad/promotion_tag_bg_small24a2fe.png)
    no-repeat;
    font-size: 12px;
    -webkit-background-size: 69px 19px;
    background-size: 69px 19px;
    bottom: 10px;
    padding-left: 6px
}

.article .top_banner .rich_media_extra .brand_logo {
    width: 20%;
    right: 2.22%
}

.article .top_banner .rich_media_extra .brand_logo img {
    max-height: 35px
}

.article .top_banner .rich_media_extra .ad_msg_mask {
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    text-align: center;
    line-height: 200px;
    background-color: #000;
    -moz-opacity: .2;
    -khtml-opacity: .2;
    opacity: .2
}

.article .top_banner .rich_media_extra .ad_msg_mask img {
    position: absolute;
    width: 16px;
    top: 50%;
    margin-top: -8px;
    left: 50%;
    margin-left: -8px
}

.article .top_banner .preview_group.obvious_app {
    min-height: 54px;
    position: relative
}

.article .top_banner .preview_group.obvious_app .pic_app {
    width: 66.6%
}

.article .top_banner .preview_group.obvious_app .pic_app img {
    height: 100%;
    min-height: 54px
}

.article .top_banner .preview_group.obvious_app .info_app {
    width: 33%;
    left: 68%
}

.article .top_banner .preview_group.obvious_app .info_app .name_app {
    line-height: 18px;
    font-size: 13px
}

.article .top_banner .preview_group.obvious_app .info_app .profile_app {
    font-size: 10px
}

.article .top_banner .preview_group.obvious_app .info_app .dm_app {
    bottom: 5px
}

.article .top_banner .preview_group.obvious_app .info_app .dm_app .ad_btn
{
    font-size: 12px;
    padding-left: 17px;
    line-height: 16px
}

.article .top_banner .preview_group.obvious_app .info_app .dm_app .ad_btn.btn_download,.article .top_banner .preview_group.obvious_app .info_app .dm_app .ad_btn.btn_install,.article .top_banner .preview_group.obvious_app .info_app .dm_app .ad_btn.btn_installed,.article .top_banner .preview_group.obvious_app .info_app .dm_app .ad_btn.btn_open
{
    -webkit-background-size: 14px 14px;
    background-size: 14px 14px;
    background-position: 0 center;
    -webkit-background-position: 0 center
}

.article .top_banner .preview_group.obvious_app .info_app .dm_app .extra_info
{
    display: none
}

.article .preview_group.obvious_app .info_app .grade_app .stars.star_half
{
    backgroud-position: 0
}

.article .preview_group.obvious_app .info_app .grade_app .stars.star_one
{
    background-position: 0 -11px
}

.article .preview_group.obvious_app .info_app .grade_app .stars.star_one_half
{
    background-position: 0 -22px
}

.article .preview_group.obvious_app .info_app .grade_app .stars.star_two
{
    background-position: 0 -33px
}

.article .preview_group.obvious_app .info_app .grade_app .stars.star_two_half
{
    background-position: 0 -44px
}

.article .preview_group.obvious_app .info_app .grade_app .stars.star_three
{
    background-position: 0 -55px
}

.article .preview_group.obvious_app .info_app .grade_app .stars.star_three_half
{
    background-position: 0 -66px
}

.article .preview_group.obvious_app .info_app .grade_app .stars.star_four
{
    background-position: 0 -77px
}

.article .preview_group.obvious_app .info_app .grade_app .stars.star_four_half
{
    background-position: 0 -88px
}

.article .preview_group.obvious_app .info_app .grade_app .stars.star_five
{
    background-position: 0 -99px
}

.article .mpda_card .cardticket_theme:after,.article .mpda_card .cardticket_theme:before
{
    top: 0;
    width: 8px;
    height: 10px;
    vertical-align: middle;
    display: inline-block;
    position: absolute;
    content: " "
}

.article .db {
    display: block
}

.article .qqmusic_area {
    display: inline-block;
    width: 100%;
    vertical-align: top;
    margin: 17px 1px 16px 0;
    font-size: 0;
    line-height: 0;
    text-align: left
}

.article .qqmusic_area .unsupport_tips {
    display: none;
    padding: 20px 20px 8px;
    line-height: 1.6;
    font-size: 16px
}

.article .qqmusic_area .pic_qqmusic_default {
    position: absolute;
    top: 50%;
    left: 50%;
    margin-top: -18.5px;
    margin-left: -18.5px;
    width: 37px;
    height: 37px;
    display: none
}

.article .qqmusic_area.unsupport .unsupport_tips {
    display: block
}

.article .qqmusic_area.unsupport .pic_qqmusic_default {
    display: inline-block
}

.article .qqmusic_area.unsupport .icon_qqmusic_switch {
    display: none
}

.article .qqmusic_wrp {
    border: 1px solid #ebebeb;
    line-height: 1.6
}

.article .qqmusic_bd {
    position: relative;
    background-color: #fcfcfc;
    overflow: hidden
}

.article .qqmusic_ft {
    text-align: right;
    background-color: #f5f5f5;
    border-top: 1px solid #ebebeb;
    line-height: 2.5;
    overflow: hidden;
    font-size: 11px;
    padding: 0 .5em
}

.article .play_area {
    float: left;
    width: 60px;
    height: 60px;
    margin-right: 12px;
    position: relative
}

.article .qqmusic_thumb {
    display: block;
    width: 60px;
    height: 60px !important
}

.article .access_area {
    display: block;
    color: #8c8c8c;
    min-height: 60px;
    overflow: hidden;
    margin-right: 10px;
    outline: 0
}

.article .qqmusic_singername,.article .qqmusic_songname {
    display: block;
    width: auto;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    word-wrap: normal
}

.article .qqmusic_songname {
    padding: 7px 0 3px;
    margin-bottom: -4px;
    font-size: 16px;
    color: #3e3e3e
}

.article .qqmusic_singername {
    font-size: 14px;
    margin-right: 20px
}

.article .qqmusic_source {
    position: absolute;
    right: 6px;
    bottom: 6px
}

.article .qqmusic_source img {
    width: 13px;
    height: 13px;
    vertical-align: top;
    border: 0
}
.article .audio_area {
    display: inline-block;
    width: 100%;
    vertical-align: top;
    margin: 5px 1px 5px 0;
    font-size: 0;
    position: relative
}

.article .audio_area .audio_title {
    font-weight: 400;
    font-size: 17px;
    margin-top: -2px;
    margin-bottom: -3px;
    width: auto;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    word-wrap: normal
}

.article .audio_area .audio_source,.article .pay_tips,.article .pop_tips .inner
{
    font-size: 14px
}

.article .audio_area .audio_length {
    float: right;
    font-size: 14px;
    margin-top: 3px;
    margin-left: 1em
}

.article .audio_area .progress_bar {
    position: absolute;
    left: 0;
    bottom: 0;
    background-color: #0cbb08;
    height: 2px
}

.article .audio_area .unsupport_tips {
    display: none;
    padding: 20px 20px 8px;
    line-height: 1.6;
    font-size: 16px
}

.article .audio_area .pic_audio_default {
    display: none;
    width: 18px
}

.article .audio_area.unsupport .unsupport_tips {
    display: block
}

.article .audio_area.unsupport .pic_audio_default {
    display: inline-block
}

.article .audio_area.unsupport .icon_audio_default,.article .audio_area.unsupport .icon_audio_playing
{
    display: none
}

.article .audio_wrp {
    border: 1px solid #ebebeb;
    background-color: #fcfcfc;
    overflow: hidden;
    padding: 12px 20px 12px 12px
}

.article .audio_info_area {
    overflow: hidden
}

.article .audio_play_area {
    float: left;
    margin: 9px 22px 10px 5px;
    font-size: 0;
    width: 18px;
    height: 25px
}

.article .playing .audio_play_area .icon_audio_playing {
    display: inline-block
}

.article .playing .audio_play_area .icon_audio_default {
    display: none
}

.article .iframe_full_video {
    position: fixed !important;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    z-index: 1000;
    background-color: #000;
    margin-top: 0 !important
}

.article #videoBOx {
    position: relative
}

.article #videoBOx:after {
    position: absolute;
    content: ' ';
    bottom: 2px;
    right: 0;
    width: 50px;
    height: 40px;
    z-index: 1000000
}

.article .video_iframe {
    display: block
}

.article .video_ad_iframe {
    border: 0;
    position: absolute;
    left: 0;
    top: 0;
    z-index: 100;
    width: 100%;
    height: 100%;
    background-color: #fff
}

@media ( min-device-width :375px) and (max-device-width:667px) and
(-webkit-min-device-pixel-ratio:2) {
    .article .mm_appmsg .discuss_list,.article .mm_appmsg .rich_media_extra,.article .mm_appmsg .rich_media_inner,.article .mm_appmsg .rich_media_meta,.article .mm_appmsg .title_tips .tips
    {
        font-size: 17px
    }
    .article .mm_appmsg .meta_original_tag {
        font-size: 15px
    }
}

@media ( min-device-width :414px) and (max-device-width:736px) and
(-webkit-min-device-pixel-ratio:3) {
    .article .mm_appmsg .rich_media_title {
        font-size: 25px
    }
}

@media screen and (max-width:1023px) {
    .article .qr_code_pc_outer {
        display: none !important
    }
}

@media screen and (min-width:1024px) {
    .article .discuss_container.access,.article .rich_media {
        width: 740px;
        margin-left: auto;
        margin-right: auto
    }
    .article .rich_media_meta,.article .rich_media_meta.nickname {
        max-width: none
    }
    .article .rich_tips.with_line .tips,.article body {
        background-color: #fff
    }
    .article .rich_media_inner {
        padding: 20px
    }
    .article a.rich_media_meta_nickname {
        display: inline-block !important
    }
    .article span.rich_media_meta_nickname {
        display: none !important
    }
    .article .rich_media_content {
        min-height: 350px
    }
    .article .rich_media_title {
        padding-bottom: 10px;
        margin-bottom: 14px;
        border-bottom: 1px solid #e7e7eb
    }
    .article .discuss_container.access {
        background-color: #fff
    }
    .article .discuss_container.editing .frm_textarea_box {
        margin: 0
    }
    .article .frm_textarea_box {
        position: relative
    }
    .article .frm_textarea_box:after,.article .frm_textarea_box:before {
        content: " ";
        position: absolute;
        top: 0;
        width: 1px;
        height: 100%;
        border-left: 1px solid #e7e6e4
    }
    .article .frm_textarea_box:before {
        left: 0;
        -webkit-transform-origin: 0 0;
        transform-origin: 0 0;
        -webkit-transform: scaleX(.5);
        transform: scaleX(.5)
    }
    .article .frm_textarea_box:after {
        -webkit-transform-origin: 0 0;
        transform-origin: 0 0;
        -webkit-transform: scaleX(.5);
        transform: scaleX(.5);
        left: auto;
        right: -2px
    }
}

@media screen and (min-width:1025px) {
    .article body {
        font-family: "Helvetica Neue", Helvetica, "Hiragino Sans GB",
        "Microsoft YaHei", Arial, sans-serif
    }
    .article .rich_media {
        position: relative
    }
    .article .rich_media_inner {
        background-color: #fff;
        padding-bottom: 100px;
        position: relative
    }
    .article .qr_code_pc_outer {
        display: block !important;
        position: fixed;
        left: 0;
        right: 0;
        top: 20px;
        color: #717375;
        text-align: center
    }
    .article .qr_code_pc_inner {
        position: relative;
        width: 740px;
        margin-left: auto;
        margin-right: auto
    }
    .article .qr_code_pc {
        position: absolute;
        right: -145px;
        top: 0;
        padding: 16px;
        border: 1px solid #d9dadc;
        background-color: #fff
    }
    .article .qr_code_pc p {
        font-size: 14px;
        line-height: 20px
    }
    .article .qr_code_pc_img {
        width: 102px;
        height: 102px
    }
}

.article .text_unselecet {
    -moz-user-select: none;
    -khtml-user-select: none;
    -webkit-user-select: none;
    user-select: none
}

.article .pay_reading_area {
    padding: 60px 8px 30px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    margin: 0 auto
}

.article .pay_tit_tips_wrp {
    position: relative
}

.article .pay_tit_tips_wrp:before {
    content: " ";
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 1px;
    border-top: 1px solid #e0e0e0;
    -webkit-transform-origin: 0 0;
    transform-origin: 0 0;
    -webkit-transform: scaleY(.5);
    transform: scaleY(.5)
}

.article .pay_tit_tips {
    position: relative;
    top: -.75em;
    padding: 0 .5em;
    background-color: #fff;
    color: #8c8c8c
}

.article .pay_tit_sub_tips {
    word-wrap: break-word;
    word-break: break-all;
    margin: -12px 0 10px
}

.article .btn_pay_reading {
    width: 180px;
    height: 35px;
    line-height: 35px;
    text-align: center;
    border-radius: 3px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    color: #0aba07;
    border: 1px solid #0aba07;
    margin: 5px 0 14px;
    display: inline-block
}

.article .btn_pay_reading.disabled {
    border-color: #d5d6d7;
    color: #c4c2c5;
    background-color: #fbfbfd
}

.article .pop_tips .inner {
    width: 280px;
    box-sizing: border-box;
    border-radius: 5px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    background-color: #f7f7f9;
    position: fixed;
    left: 50%;
    top: 28%;
    margin-left: -140px;
    z-index: 20
}

.article .pop_tips .inner .tips_title {
    font-size: 16px;
    display: block;
    vertical-align: middle;
    max-width: 98%;
    padding: 15px 10px 0;
    color: #3e3e3e;
    text-align: center
}

.article .pop_tips .inner .tips_con {
    color: #888;
    font-size: 14px;
    padding: 10px 15px
}

.article .pop_tips .inner .tips_opr {
    line-height: 50px;
    font-size: 18px
}

.article .pop_tips .inner .tips_opr .ft_btn {
    position: relative;
    width: 280px;
    display: block;
    text-align: center;
    color: #0aba07
}

.article .pop_tips .inner .tips_opr .ft_btn:before {
    content: " ";
    position: absolute;
    top: 0;
    width: 100%;
    height: 1px;
    border-top: 1px solid #ececec;
    -webkit-transform-origin: 0 0;
    transform-origin: 0 0;
    -webkit-transform: scaleY(.5);
    transform: scaleY(.5);
    left: 0
}

.article .pop_tips .mask {
    width: 100%;
    height: 100%;
    position: fixed;
    left: 0;
    top: 0;
    background-color: rgba(0, 0, 0, .4);
    z-index: 1
}

.article .wx_poptips_wrp.pay_reading {
    top: 50%;
    margin-top: -60px
}

.article .wx_poptips_wrp.pay_reading .toast_content {
    margin-top: 75px
}
.favour{
    background: transparent url(/images/favour.png) no-repeat 0 -19px;
    width: 14px;
    height: 14px;
    -webkit-background-size: 100% auto;
    background-size: 100% auto;
}
.w_my_art{
    padding-top: 10px;
}
.article .article-info {
    margin-bottom: 15px;
    font-size: 15px;
    color: #b1b1b1;
    line-height: null;
    height: 56px;
}
.article .article-info a {
    margin-left: 15px;
}
.article .article-info .time {
    float: left;
    margin-left: 15px;
}
#mcover {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.7);
    
    z-index: 999999;
}
#mcover .img {
    position: fixed;
    right: 18px;
    top: 5px;
    width: 260px !important;
    height: 180px !important;
    z-index: 999999;
}
.music_bg {
    width: 100%;
    background: #ededed;
    border-radius: 6px;
}
.music {
    width: 100%;
    height: 42px;
    border-radius: 5px;
    margin: 10px 8px 0 0;
    padding: 0;
    line-height: 42px;
    cursor: pointer;
}
.music i[play=on] {
    background-image: url('/images/article/music_pu_on.png');
}
.music i[play=stop] {
    background-image: url('/images/article/music_pu_stop.png');
}

.music .icon_1[play=on] {
    background-image: url('/images/article/music_pu_on.png');
}
.music .icon_1[play=stop] {
    background-image: url('/images/article/music_pu_stop.png');
}

.music .icon_2[play=on] {
    background-image: url('/images/article/music_mu_on.png');
}
.music .icon_2[play=stop] {
    background-image: url('/images/article/music_mu_stop.png');
}

.music .icon_3[play=on] {
    background-image: url('/images/article/music_xin_on.png');
}
.music .icon_3[play=stop] {
    background-image: url('/images/article/music_xin_stop.png');
}

.music .icon_4[play=on] {
    background-image: url('/images/article/music_keai_on.png');
}
.music .icon_4[play=stop] {
    background-image: url('/images/article/music_keai_stop.png');
}

.music .icon_5[play=on] {
    background-image: url('/images/article/music_yang_on.png');
}
.music .icon_5[play=stop] {
    background-image: url('/images/article/music_yang_stop.png');
}

.music i {
    float: left;
    width: 25px;
    height: 25px;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
    margin: 8px 10px 0 15px;
}
.music span {
    width: calc(100% - 70px);
    width: -webkit-calc(100% - 70px);
    margin: 0;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.hide{
    display:none;
}
.audio_area {
    display: block;
    margin: 12px 1px 12px 1px;
    font-size: 0;
    position: relative;
    font-weight: 400;
    text-decoration: none;
    -ms-text-size-adjust: none;
    -webkit-text-size-adjust: none;
    text-size-adjust: none;
}
.audio_area .unsupport_tips {
    display: none;
    padding: 20px 20px 8px;
    line-height: 1.6;
    font-size: 16px;
}
.audio_wrp {
    /* border: 1px solid #ebebeb; */
    background-color: #fcfcfc;
    overflow: hidden;
    padding: 12px 20px 12px 12px;
}
.audio_play_area {
    float: left;
    margin: 9px 22px 10px 15px;
    font-size: 0;
    width: 18px;
    height: 25px;
}
.audio_play_area .icon_audio_default {
    background: transparent url(/images/advert/icon_audio.png) no-repeat 0 0;
    width: 18px;
    height: 25px;
    vertical-align: middle;
    display: inline-block;
    -webkit-background-size: 18px auto;
    background-size: 18px auto;
}

.audio_area .audio_length {
    float: right;
    font-size: 14px;
    margin-top: 3px;
    margin-left: 1em;
    margin-right: 10px;
}
.tips_global {
    color: #8c8c8c;
}
.audio_info_area {
    overflow: hidden;
}
.audio_area .audio_title {
    font-weight: 400;
    font-size: 17px;
    margin-top: -2px;
    margin-bottom: -3px;
    width: 100px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    word-wrap: normal;
    text-align: left;
}
.audio_area .audio_source {
    display: block;
    font-size: 14px;
}
.tips_global {
    color: #8c8c8c;
}
#music_desc{
    color: #545454;
}
.xuan_bottom_img {
    max-height: 100px;
}
.linkClass{
    color: blue!important;
    text-decoration: underline ;
}
.footcard_content {
    margin-top: 0.7rem;
    background: #fff;
    width: 100%;
    position: relative;
}
.footcard_big_body {
    overflow: hidden;
}
.footcard_big_left {
    float: left;
    width: 50%;
    padding-bottom: 10px;
}
.footcard_big_face {
    text-align: center;
    padding: 10px 0 10px;
    cursor: pointer;
}
.footcard_face {
    margin: 0 10px 0 0;
    position: relative;
    display: inline-block;
}
.footcard_face_img {
    width: 60px;
    height: 60px;
    border-radius: 50%;
}
.footcard_vip_img {
    position: absolute;
    bottom: 0;
    right: 0;
    height: 1.1rem;
    width: 1.1rem;
    padding: .1rem;
    background: #f8f2e6;
    border-radius: 50%;
}
.footcard_big_item {
    font-size: 14px;
    padding: 0 3px 0 30px;
    height: 23px;
    line-height: 23px;
    cursor: pointer;
}
.footcard_big_name .ftcard_name {
    font-size: 14px;
}
.footcard_job {
    color: #000;
    font-size: .6rem;
    margin-left: .3rem;
}

.footcard_big_right {
    float: right;
    width: 48%;
    position: relative;
}
.footcard_big_comp {
    text-align: center;
    margin: .7rem 1rem;
    height: 0.5rem;
    line-height: 1.5rem;
}
.footcard_big_company {
    display: inline-block;
    height: 1.5rem;
    line-height: 1.5rem;
}
.footcard_big_companyLogo {
    float: left;
    width: 1.5rem;
    height: 1.5rem;
    border-radius: 50%;
    display: none;
}
.footcard_big_companyName {
    font-size: .6rem;
    color: #000;
    height: 1.5rem;
    line-height: 1.5rem;
    margin-left: .3rem;
}
.footcard_big_qrcode {
    margin: 0 8px;
    height: 100px;
    text-align: center;
}
.footcard_big_qrcode img {
    max-width: 100%;
    max-height: 100%;
    vertical-align: middle;
    background: #fff;
    padding: .1rem;
}
.footcard_big_tips {
    text-align: center;
    margin: .3rem 0 .6rem;
    height: .9rem;
    line-height: .9rem;
}
.footcard_big_tips span {
    height: .9rem;
    line-height: .9rem;
    border-radius: .45rem;
    font-size: .6rem;
    color: #000;
    padding: 0 .6rem;
    background: #fff;
    display: inline-block;
}
.footcard_big_weizhan {
    position: absolute;
    right: 0;
    top: 0;
    width: 2.75rem;
    cursor: pointer;
}
.xuan_bottom_img .advertItems {
   margin-top: 0px; 
}
.xuan_bottom_img .advertItems .advert.style-1 img {
    background-size: cover;
    height: 100%;
    display: block;
    border: none;
    width: 100%;
    max-height: 100px;
}
.article_poster {
    width: 50px;height: 50px;border-radius:50%;position: fixed;left: 4%;bottom: 215px;border: 0px;padding: 5px;
    color:#fff;background-color: rgba(255, 153, 0, 0.95); 
    -moz-box-shadow: 10px 10px 5px #888888;box-shadow: 2px 2px 1px #888888;
}
.article_poster_model_select{
    border: 2px solid rgb(255, 207, 3); color: rgb(115, 67, 33);
}
.toolbar .picker-button-left {
    position: absolute;
    left: 0;
    box-sizing: border-box;
    height: 2.2rem;
    line-height: 2.2rem;
    color: #04BE02;
    z-index: 1;
    padding: 0 .5rem;
}
.footcard_big_name {
    background: url(//media.zmpal.com/zmpal/cardbg/big_name2.png) no-repeat .4rem center;
    background-size: .75rem auto;
    color: #000;
}
.footcard_big_wxNo {
    background: url(//media.zmpal.com/zmpal/cardbg/big_wechat2.png) no-repeat .4rem center;
    background-size: .75rem auto;
    color: #000;
}
.footcard_big_phone {
    background: url(//media.zmpal.com/zmpal/cardbg/big_phone.png) no-repeat .4rem center;
    background-size: .75rem auto;
    color: #014fff;
    font-weight: bold;
}


.zsxt_form {
    width: 100%;
}
.formstyleul li {
    background: #fff;
    height: 40px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    position: relative;
    font-size: 13px;
}
.formstyleul li span {
    color: #848484;
    position: absolute;
    left: 0;
    top: 10px;
    width: 20%;
    padding-right: 5px;
    text-align: right;
    border-right: 1px solid #cbcbcb;
}
.formstyleul li input {
    height: 40px;
    line-height: normal;
    background: none;
    border: none;
    position: absolute;
    left:22%;
    width: 75%;
}
.form_submit {
    cursor: pointer;
    width: 100%;
    height: 40px;
    background: #58c8d3;
    margin-top: 10px;
    line-height: 40px;
    color: #fff;
    text-align: center;
    font-size: 16px;
    border-radius: 3px;
}
.form_title{
    cursor: pointer;
    width: 100%;
    height: 35px;
    background: #fff;
    margin-top: 10px;
    margin-bottom: 5px;line-height: 35px;color: #848484;text-align: center;font-size: 16px;
}
img{
    max-width: 100% !important;
}
</style>
}
</head>
<body ontouchstart>
	<div class="page">
        <br>
		<article class="rich_media_content" id="article" style="padding: 10px;">

            <div class="music_bg hide" style="margin-bottom: 8px;" onclick="switchsound()"> 
               <script type="text/javascript">var music_url = "";</script> 
               <span class="music" data-url=""><i play="on" id="music_icon"></i><span id="music_desc"></span></span>
           </div> 
           <p class="" data-bg="rgba(0, 0, 0, 0)"></p>
           <p class="" data-bg="rgba(0, 0, 0, 0)" style="background-color: rgba(0, 0, 0, 0); overflow-x: hidden; overflow-y: scroll; font-weight: bold; text-align: center;">团队概况</p>
           <br>
           <p></p>
           <p class="p"></p>
           <p class="p"><img style="width: auto; height: auto; background: none; display: inline;" class="" data-original="http://weix.91zsxt.cn/upload/201805/9mFuIoRY_C959abbY0GPNG3lGrnHTsRrgtNf_15xH-vVZ91fg-8eGiwsYSVfdpHO.jpg" src="http://weix.91zsxt.cn/upload/201805/9mFuIoRY_C959abbY0GPNG3lGrnHTsRrgtNf_15xH-vVZ91fg-8eGiwsYSVfdpHO.jpg"></p>
           <p class="p"><img style="width: auto; height: auto; background: none; display: inline;" data-original="http://weix.91zsxt.cn/upload/201805/0TdkCRs1WnyGWuRYsKGVcQoaq-2Rd-cN-nYEf7ejYnpmt_3hLsNvcblNxQedb8Ye.jpg" src="http://weix.91zsxt.cn/upload/201805/0TdkCRs1WnyGWuRYsKGVcQoaq-2Rd-cN-nYEf7ejYnpmt_3hLsNvcblNxQedb8Ye.jpg"></p>
           <p></p>
           <p></p>
           <br>
           <p></p>
           <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" data-id="24" data-tools="135编辑器" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei"> 
               <section style="margin: 10px auto;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"> 
                  <section style="margin: 3px;padding: 15px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;line-height: 24px;box-shadow: rgb(170, 170, 170) 0px 0px 3px 0px;border-width: 2px;border-style: solid;border-color: rgb(240, 240, 240);"> 
                     <p class=""><span style="color: rgb(2, 30, 170);"><strong class=""><span style="font-size: 14px; background-color: rgba(0, 0, 0, 0); overflow-x: hidden; overflow-y: scroll; color: rgb(0, 0, 0);" class="" data-bg="rgba(0, 0, 0, 0)">训练场大 城南加油站前行1公里 （三丫角）</span></strong></span></p> 
                     <p class="" data-bg="rgba(0, 0, 0, 0)" style="overflow-x: hidden; overflow-y: scroll; background-color: rgba(0, 0, 0, 0);"><span style="color: rgb(2, 30, 170);"><strong><span style="color: rgb(0, 0, 0); font-size: 15px; overflow-x: hidden; overflow-y: scroll; background-color: rgba(0, 0, 0, 0);" class="" data-bg="rgba(0, 0, 0, 0)">场地标准 不需要到模拟场模拟训练 直接考试</span></strong></span></p> 
                     <p><span style="color: rgb(2, 30, 170);"><strong><span style="color: rgb(0, 0, 0); font-size: 14px; overflow-x: hidden; overflow-y: scroll; background-color: rgba(0, 0, 0, 0);" class="" data-bg="rgba(0, 0, 0, 0)">省模拟费 就近学车省伙食费 来回自由包接送</span></strong></span></p> 
                     <p class="" data-bg="rgba(0, 0, 0, 0)" style="overflow-x: hidden; overflow-y: scroll; color: rgb(0, 0, 0); font-size: 14px; background-color: rgba(0, 0, 0, 0);"><font color="#021eaa"><span style="font-size: 15px;"><b class="" data-bg="rgba(0, 0, 0, 0)" style="overflow-x: hidden; overflow-y: scroll; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">不怕风吹雨淋 有蓬有伞带冷气</b></span></font></p> 
                     <p><span style="color: rgb(2, 30, 170);"><strong><span style="color: rgb(0, 0, 0); font-size: 14px; background-color:rgba(0, 0, 0, 0);overflow: hidden;overflow-y: scroll;" class="" data-bg="rgba(0, 0, 0, 0)">车多练车不排队 一台车二人搭配 效率高</span></strong></span></p> 
                     <p class=""><span style="color: rgb(2, 30, 170);"><strong><span style="color: rgb(0, 0, 0); font-size: 15px; overflow-x: hidden; overflow-y: scroll; background-color: rgba(0, 0, 0, 0);" class="" data-bg="rgba(0, 0, 0, 0)">随到随学 学员安排教练 解决上班族的烦恼</span></strong></span></p> 
                     <p class=""><span style="color: rgb(2, 30, 170);"><strong><span style="color: rgb(0, 0, 0); font-size: 15px; overflow-x: hidden; overflow-y: scroll;" class="" data-bg="rgba(0, 0, 0, 0)">场地环境独特防日晒 上午阳一半 下午阴一半</span></strong></span><br></p> 
                 </section> 
             </section>
         </section>
         <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei" data-role="paragraph"> 
           <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;border-width: 0px;border-style: none;border-color: initial;" data-id="us420166"> 
              <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;border-width: 0px;border-style: none;border-color: initial;" data-id="85991" data-tools="135编辑器" data-color="#02CC9D"> 
                 <section style="margin: 5px auto;padding: 3px 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;border-top: 2px solid rgb(255, 0, 0);border-bottom: 2px solid rgb(255, 0, 0);"> 
                    <section style="margin: 0px;padding: 8px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;border-top: 1px solid rgb(255, 0, 0);border-bottom: 1px solid rgb(255, 0, 0);text-align: center;color: inherit;"> 
                       <p style="margin: 0px;"><span style="color: rgb(217, 33, 66);"><strong><span style="font-family: 等线; font-size: 18px; background-color: rgba(0, 0, 0, 0); overflow-x: hidden; overflow-y: scroll; color: rgb(0, 0, 0);" class="" data-bg="rgba(0, 0, 0, 0)">教学一流 技术精湛&nbsp;</span></strong></span></p> 
                   </section> 
               </section> 
           </section> 
           <p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;"><br style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"></p> 
       </section>
   </section>
   <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" data-id="us670720" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei"> 
       <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;" data-author="Wxeditor"> 
          <article style="margin: 5px auto; padding: 0px; max-width: 100%; font-size: 14px; border-width: 0px; border-style: initial; border-color: initial; box-sizing: border-box !important; word-wrap: break-word !important;" data-author="Wxeditor" class=""> 
             <section style="margin: 0px; padding: 0px; max-width: 100%; display: inline-block; overflow-x: hidden; overflow-y: scroll; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgba(0, 0, 0, 0);" class="" data-bg="rgba(0, 0, 0, 0)"> 
                <section style="margin: 0px;padding: 0px 0.5em;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;height: 1.8em;min-width: 1em;background-color: rgb(255, 0, 0);font-size: 1.125em;vertical-align: bottom;line-height: 1.8em;text-align: center;color: rgb(255, 255, 255);display: inline-block;"> 
                   <p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;"><strong style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;">01</strong></p> 
               </section> 
               <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;border-width: 0.5em 0px 0.5em 0.5em;border-style: solid;border-color: transparent transparent transparent rgb(255, 0, 0);vertical-align: middle;display: inline-block;"></section> 
               <section style="margin: 0px;padding: 0px 0.8em 0px 0.5em;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;height: 1.8em;text-align: center;line-height: 1.8em;font-size: 16px;vertical-align: middle;display: inline-block;"> 
                   <p style="margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(0, 0, 0); overflow-x: hidden; overflow-y: scroll; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgba(0, 0, 0, 0);" class="" data-bg="rgba(0, 0, 0, 0)"><font color="#ff0000"><span style="font-size: 15px;"><b class="" data-bg="rgba(0, 0, 0, 0)" style="overflow-x: hidden; overflow-y: scroll; color: rgb(0, 0, 0);">以学员安全为己任 培养路上驾驶技能</b></span></font></p> 
                   <p style="margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; overflow-x: hidden; overflow-y: scroll; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgba(0, 0, 0, 0);" class="" data-bg="rgba(0, 0, 0, 0)"><font color="#ff0000"><span style="font-size: 15px;"><b class="" data-bg="rgba(0, 0, 0, 0)" style="overflow-x: hidden; overflow-y: scroll; color: rgb(0, 0, 0);">管理严明 服务周到 少指责多引导</b></span></font></p> 
               </section> 
           </section> 
           <p style="margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;" class=""><br style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"></p> 
       </article> 
   </section>
</section>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei" data-role="paragraph"> 
</section>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" data-id="us670720" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei"> 
   <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;" data-author="Wxeditor"> 
      <article style="margin: 5px auto;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px;border-width: 0px;border-style: initial;border-color: initial;" data-author="Wxeditor"> 
         <section style="margin: 0px; padding: 0px; max-width: 100%; display: inline-block; overflow-x: hidden; overflow-y: scroll; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgba(0, 0, 0, 0);" class="" data-bg="rgba(0, 0, 0, 0)"> 
            <section style="margin: 0px;padding: 0px 0.5em;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;height: 1.8em;min-width: 1em;background-color: rgb(255, 0, 0);font-size: 1.125em;vertical-align: bottom;line-height: 1.8em;text-align: center;color: rgb(255, 255, 255);display: inline-block;"> 
               <p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;"><strong style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;">02</strong></p> 
           </section> 
           <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;border-width: 0.5em 0px 0.5em 0.5em;border-style: solid;border-color: transparent transparent transparent rgb(255, 0, 0);vertical-align: middle;display: inline-block;"></section> 
           <section style="margin: 0px;padding: 0px 0.8em 0px 0.5em;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;height: 1.8em;text-align: center;line-height: 1.8em;font-size: 16px;vertical-align: middle;display: inline-block;"> 
               <p style="margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; overflow-x: hidden; overflow-y: scroll; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgba(0, 0, 0, 0);" class="" data-bg="rgba(0, 0, 0, 0)"><span style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(255, 0, 0);font-size: 15px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; overflow-x: hidden; overflow-y: scroll; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;" class="" data-bg="rgba(0, 0, 0, 0)">因材施教 口令简单 精准稳</strong></span></p> 
           </section> 
       </section> 
       <p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;"><br></p> 
   </article> 
</section>
</section>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei" data-role="paragraph"> 
</section>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" data-id="us670720" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei"> 
   <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;" data-author="Wxeditor"> 
      <article style="margin: 5px auto;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px;border-width: 0px;border-style: initial;border-color: initial;" data-author="Wxeditor"> 
         <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;display: inline-block;"> 
            <section style="margin: 0px;padding: 0px 0.5em;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;height: 1.8em;min-width: 1em;background-color: rgb(255, 0, 0);font-size: 1.125em;vertical-align: bottom;line-height: 1.8em;text-align: center;color: rgb(255, 255, 255);display: inline-block;"> 
               <p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;"><strong style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;">03</strong></p> 
           </section> 
           <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;border-width: 0.5em 0px 0.5em 0.5em;border-style: solid;border-color: transparent transparent transparent rgb(255, 0, 0);vertical-align: middle;display: inline-block;"></section> 
           <section style="margin: 0px;padding: 0px 0.8em 0px 0.5em;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;height: 1.8em;text-align: center;line-height: 1.8em;font-size: 16px;vertical-align: middle;display: inline-block;"> 
               <p style="margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; overflow-x: hidden; overflow-y: scroll; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgba(0, 0, 0, 0);" class="" data-bg="rgba(0, 0, 0, 0)"><span style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(255, 0, 0);font-size: 15px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; background-color: rgba(0, 0, 0, 0); overflow-x: hidden; overflow-y: scroll; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 0, 0);" class="" data-bg="rgba(0, 0, 0, 0)">多指正少指责 积极培养学员开车胆量</strong></span></p> 
           </section> 
       </section> 
       <p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;"><br></p> 
   </article> 
</section>
</section>
<p></p>
<p></p>
<p class="p"><img style="width: auto; height: auto; background: none; display: inline;" data-original="http://weix.91zsxt.cn/upload/201805/Mvhs_LyZHERuQxFSXWN4zs1RsMKVCIoYHCOQgK-viZpluEhQCQ0Stb1msg6g8cms.jpg" src="http://weix.91zsxt.cn/upload/201805/Mvhs_LyZHERuQxFSXWN4zs1RsMKVCIoYHCOQgK-viZpluEhQCQ0Stb1msg6g8cms.jpg"></p>
<p></p>
<p><span style="font-size: 15px;"></span></p>
<p><br></p>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" data-id="us670720" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei"> 
   <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;" data-author="Wxeditor"> 
      <article style="margin: 5px auto;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px;border-width: 0px;border-style: initial;border-color: initial;" data-author="Wxeditor"> 
         <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;display: inline-block;"> 
            <section style="margin: 0px;padding: 0px 0.5em;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;height: 1.8em;min-width: 1em;background-color: rgb(255, 0, 0);font-size: 1.125em;vertical-align: bottom;line-height: 1.8em;text-align: center;color: rgb(255, 255, 255);display: inline-block;"> 
               <p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;"><strong style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;">04</strong></p> 
           </section> 
           <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;border-width: 0.5em 0px 0.5em 0.5em;border-style: solid;border-color: transparent transparent transparent rgb(255, 0, 0);vertical-align: middle;display: inline-block;"></section> 
           <section style="margin: 0px;padding: 0px 0.8em 0px 0.5em;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;height: 1.8em;text-align: center;line-height: 1.8em;font-size: 16px;vertical-align: middle;display: inline-block;"> 
               <p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;"><span style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(255, 0, 0);font-size: 15px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; background-color: rgba(0, 0, 0, 0); overflow-x: hidden; overflow-y: scroll; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 0, 0);" class="" data-bg="rgba(0, 0, 0, 0)">真诚待人 清正廉洁 收费公开透明</strong></span></p> 
           </section> 
       </section> 
       <p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;"><br></p> 
   </article> 
</section>
</section>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei" data-role="paragraph"> 
   <span style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(76, 76, 76);font-size: 15px;"></span>
</section>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" data-id="us670720" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei"> 
   <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;" data-author="Wxeditor"> 
      <article style="margin: 5px auto;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px;border-width: 0px;border-style: initial;border-color: initial;" data-author="Wxeditor"> 
         <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;display: inline-block;"> 
            <section style="margin: 0px;padding: 0px 0.5em;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;height: 1.8em;min-width: 1em;background-color: rgb(255, 0, 0);font-size: 1.125em;vertical-align: bottom;line-height: 1.8em;text-align: center;color: rgb(255, 255, 255);display: inline-block;"> 
               <p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;"><strong style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;">05</strong></p> 
           </section> 
           <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;border-width: 0.5em 0px 0.5em 0.5em;border-style: solid;border-color: transparent transparent transparent rgb(255, 0, 0);vertical-align: middle;display: inline-block;"></section> 
           <section style="margin: 0px;padding: 0px 0.8em 0px 0.5em;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;height: 1.8em;text-align: center;line-height: 1.8em;font-size: 16px;vertical-align: middle;display: inline-block;"> 
               <p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;"><span style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(255, 0, 0);font-size: 15px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; background-color: rgba(0, 0, 0, 0); overflow-x: hidden; overflow-y: scroll; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(0, 0, 0);" class="" data-bg="rgba(0, 0, 0, 0)">合格率高 轻松学车 开心拿证</strong></span></p> 
           </section> 
       </section> 
       <p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;"><br style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"></p> 
   </article> 
</section>
</section>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei" data-role="paragraph"> 
   <p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;line-height: 1.75em;"></p>
</section>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" data-id="us670720" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei"> 
   <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;" data-author="Wxeditor"> 
      <article style="margin: 5px auto;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px;border-width: 0px;border-style: initial;border-color: initial;" data-author="Wxeditor"> 
         <section style="margin: 0px; padding: 0px; max-width: 100%; display: inline-block; overflow-x: hidden; overflow-y: scroll; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgba(0, 0, 0, 0);" class="" data-bg="rgba(0, 0, 0, 0)"> 
            <section style="margin: 0px;padding: 0px 0.5em;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;height: 1.8em;min-width: 1em;background-color: rgb(255, 0, 0);font-size: 1.125em;vertical-align: bottom;line-height: 1.8em;text-align: center;color: rgb(255, 255, 255);display: inline-block;"> 
               <p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;"><b>收费标准</b></p> 
           </section> 
           <br> 
       </section> 
       <p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;"><br></p> 
   </article> 
</section>
</section>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei" data-role="paragraph"> 
   <p><span style="font-size: 15px; overflow-x: hidden; overflow-y: scroll; background-color: rgba(0, 0, 0, 0);" class="" data-bg="rgba(0, 0, 0, 0)">4500元 手波自动波同样价格 所有科目补考费全包 路考包培训包过关 亲力亲为 不加收费用</span></p> 
   <p><br></p>
</section>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" data-id="us670720" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei"> 
   <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;" data-author="Wxeditor"> 
      <article style="margin: 5px auto; padding: 0px; max-width: 100%; font-size: 14px; border-width: 0px; border-style: initial; border-color: initial; overflow-x: hidden; overflow-y: scroll; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgba(0, 0, 0, 0);" data-author="Wxeditor" class="" data-bg="rgba(0, 0, 0, 0)"> 
         <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;display: inline-block;"> 
            <b> 
               <section style="margin: 0px;padding: 0px 0.5em;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;height: 1.8em;min-width: 1em;background-color: rgb(255, 0, 0);font-size: 1.125em;vertical-align: bottom;line-height: 1.8em;text-align: center;color: rgb(255, 255, 255);display: inline-block;"> 
                  <p style="margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;" class="">付款方式</p> 
              </section></b> 
          </section> 
          <p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;"><br style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"></p> 
      </article> 
  </section>
</section>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei" data-role="paragraph"> 
   <p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;line-height: 1.75em;"><span style="font-size: 15px; overflow-x: hidden; overflow-y: scroll; background-color: rgba(0, 0, 0, 0);" class="" data-bg="rgba(0, 0, 0, 0)">一：零首付分期 十二个月银行按揭 无需抵押 提供身份证与个人信用即可。</span></p> 
   <div>
     二：先付2000元 路考合格付清剩余学费。 
 </div> 
 <div>
     三：可以免手续费刷卡 可以使用支付宝花呗付款 
 </div> 
</section>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" data-id="us670720" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei"> 
   <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;" data-author="Wxeditor"> 
      <article style="margin: 5px auto;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px;border-width: 0px;border-style: initial;border-color: initial;" data-author="Wxeditor"> 
      </article> 
  </section>
</section>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" data-id="us670720" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei"> 
   <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;" data-author="Wxeditor"> 
   </section>
</section>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei" data-role="paragraph"> 
</section>
<p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;color: rgb(62, 62, 62);" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei"><br style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"></p>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" data-id="us670720" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei"> 
   <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;" data-author="Wxeditor"> 
      <article style="margin: 5px auto;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;font-size: 14px;border-width: 0px;border-style: initial;border-color: initial;" data-author="Wxeditor"> 
         <section style="margin: 0px; padding: 0px; max-width: 100%; display: inline-block; overflow-x: hidden; overflow-y: scroll; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgba(0, 0, 0, 0);" class="" data-bg="rgba(0, 0, 0, 0)"> 
            <section style="margin: 0px;padding: 0px 0.5em;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;height: 1.8em;min-width: 1em;background-color: rgb(255, 0, 0);font-size: 1.125em;vertical-align: bottom;line-height: 1.8em;text-align: center;color: rgb(255, 255, 255);display: inline-block;"> 
               <p style="margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; overflow-x: hidden; overflow-y: scroll; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgba(0, 0, 0, 0);" class="" data-bg="rgba(0, 0, 0, 0)"><b>丰圣汽车咨询服务公司</b></p> 
           </section> 
           <br> 
       </section> 
       <p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;"><br></p> 
   </article> 
</section>
</section>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei" data-role="paragraph"> 
   <p><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(76, 76, 76); font-size: 15px; overflow-x: hidden; overflow-y: scroll; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgba(0, 0, 0, 0);" class="" data-bg="rgba(0, 0, 0, 0)">增加业务范围：二手车出售 及免手续费代办各种车管所业务 如入户 年审 换证 补证等</span><span style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(76, 76, 76);font-size: 15px;"><br></span></p> 
   <p><br></p>
</section>
<p></p>
<p class="p"></p>
<p class="p"><img style="width: auto; height: auto; background: none; display: inline;" data-original="http://weix.91zsxt.cn/upload/201805/tuveMGar1Nl8WsaHr43WProMzP2WLWxmakj8sSCqX7WIh6oh2d6W--uWfYXGtzjX.jpg" class="" src="http://weix.91zsxt.cn/upload/201805/tuveMGar1Nl8WsaHr43WProMzP2WLWxmakj8sSCqX7WIh6oh2d6W--uWfYXGtzjX.jpg"></p>
<p></p>
<p></p>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" data-id="us670720" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei"> 
   <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;" data-author="Wxeditor"> 
   </section>
</section>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei" data-role="paragraph"> 
</section>
<p style="margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); box-sizing: border-box !important; word-wrap: break-word !important;" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei" class=""><br style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"></p>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" data-id="us670720" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei"> 
   <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;" data-author="Wxeditor"> 
      <article style="margin: 5px auto; padding: 0px; max-width: 100%; font-size: 14px; border-width: 0px; border-style: initial; border-color: initial; overflow-x: hidden; overflow-y: scroll; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgba(0, 0, 0, 0);" data-author="Wxeditor" class="" data-bg="rgba(0, 0, 0, 0)"> 
         <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;display: inline-block;"> 
            <b> 
               <section style="margin: 0px;padding: 0px 0.5em;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;height: 1.8em;min-width: 1em;background-color: rgb(255, 0, 0);font-size: 1.125em;vertical-align: bottom;line-height: 1.8em;text-align: center;color: rgb(255, 255, 255);display: inline-block;"> 
                  <p style="margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;" class="">教学宣言：你未来的安全 就是我现在的责任</p> 
              </section></b> 
          </section> 
          <p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;"><br style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"></p> 
      </article> 
  </section>
</section>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei" data-role="paragraph"> 
   <p style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;clear: both;min-height: 1em;line-height: 1.75em;"></p>
</section>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" data-id="us670720" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei"> 
   <section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;" data-author="Wxeditor"> 
   </section>
</section>
<section style="margin: 0px;padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;color: rgb(62, 62, 62);" neue="neue" pingfang="pingfang" sc="sc" hiragino="hiragino" gb="gb" ui="ui" microsoft="microsoft" arial="arial" sans-serif="sans-serif" start="start" none="none" normal="normal" px="px" rgb="rgb" initial="initial" helvetica="helvetica" sans="sans" yahei="yahei" data-role="paragraph"> 
</section>
<div class="cardbg_content advertItems" type-value="9"> 
   <div class="footcard_content footcard_big" style="background: url(http://weix.91zsxt.cn/images/advert/card_bg1.jpg) no-repeat;background-size: 100% 100%;"> 
      <div class="footcard_big_body"> 
         <div class="footcard_big_left"> 
            <div class="footcard_big_face"> 
               <div class="footcard_face"> 
                  <img class="footcard_face_img ftcard_face" data-original="http://weix.91zsxt.cn/upload/201612/HdGYc_KKUyg-cagHqD2up-ELBqPyxYQSqRxU1qoSSDxJ5gHuhQuGdEPMNV6q_xBW.jpg" style="display: inline;" src="http://weix.91zsxt.cn/upload/201612/HdGYc_KKUyg-cagHqD2up-ELBqPyxYQSqRxU1qoSSDxJ5gHuhQuGdEPMNV6q_xBW.jpg"> 
                  <p class="p"><img style="width: auto; height: auto; background: none; display: inline;" data-original="http://img.91zsxt.cn/upload/201805/EDYxIrG5gLIkGq6KNs96Nh1UPWO3eqgEsh07k902nS_MSZ3MOI6LBv-GXlnP3ocO.jpg" class="" src="http://img.91zsxt.cn/upload/201805/EDYxIrG5gLIkGq6KNs96Nh1UPWO3eqgEsh07k902nS_MSZ3MOI6LBv-GXlnP3ocO.jpg"></p> 
                  <p class="p"></p> 
                  <p class="p"><img style="width: auto; height: auto; background: none; display: inline;" data-original="http://weix.91zsxt.cn/upload/201805/eGBcYnoYXyG0klXMLnMo_7qinExZXOqn49cq_98Og1IShLoIYsFihTklUoINF4r8.jpg" src="http://weix.91zsxt.cn/upload/201805/eGBcYnoYXyG0klXMLnMo_7qinExZXOqn49cq_98Og1IShLoIYsFihTklUoINF4r8.jpg"></p> 
                  <p></p> 
              </div> 
          </div> 
          <div class="footcard_big_item footcard_big_name overhidden1"> 
           <span class="ftcard_name" data-bg="rgba(0, 0, 0, 0)" style="overflow-x: hidden; overflow-y: scroll; background-color:rgba(0, 0, 0, 0);overflow: hidden;overflow-y: scroll;">林伟森教练</span> 
       </div> 
       <div class="footcard_big_item footcard_big_wxNo ftcard_wxNo" data-bg="rgba(0, 0, 0, 0)" style="overflow-x: hidden; overflow-y: scroll; background-color:rgba(0, 0, 0, 0);overflow: hidden;overflow-y: scroll;">
          18818328963 
      </div> 
      <div class="footcard_big_item footcard_big_phone ftcard_phone" data-bg="rgba(0, 0, 0, 0)" style="overflow-x: hidden; overflow-y: scroll; background-color:rgba(0, 0, 0, 0);overflow: hidden;overflow-y: scroll;">
          18818328963 
      </div> 
  </div> 
  <div class="footcard_big_right"> 
    <div class="footcard_big_comp"></div> 
    <div class="footcard_big_qrcode"> 
       <p class="p"><img style="width: auto; height: auto; background: none; display: inline;" data-original="http://weix.91zsxt.cn/upload/201805/zLzTqJwPMyQvsFfMy3ILMa8RQm3FyDU9TGa-D_ASTKkqSlmLH2_K0vNaY_JaneVZ.jpg" src="http://weix.91zsxt.cn/upload/201805/zLzTqJwPMyQvsFfMy3ILMa8RQm3FyDU9TGa-D_ASTKkqSlmLH2_K0vNaY_JaneVZ.jpg"></p> 
   </div> 
   <div class="footcard_big_tips"> 
       <span>长按二维码加我咨询</span> 
   </div> 
   <img class="footcard_big_weizhan" data-original="/images/advert/to_card.png" style="display: block;" src="/images/advert/to_card.png"> 
</div> 
</div> 
</div>
</div>
<p class=""><br></p>

 <div class="weui-btn-area">
    <a class="weui-btn weui-btn_primary" href="/student/join">立即报名</a>
</div>
<br>
</article>

</div>
<#include "/common.ftl">
<script type="text/javascript">
  $(".swiper-container").swiper({});
</script>
</body>
</html>