<%--
  Created by IntelliJ IDEA.
  User: Bahodir
  Date: 21.04.2023
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/locale.jsp" %>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/assets/css/plugins/dual-listbox.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/assets/css/plugins/tour.css">
    <style>
        .listBoxTitle,
        .dual-listbox__title {
            padding: 15px 10px;
            font-size: 120%;
            font-weight: 700;
            margin-top: 1rem;
            -webkit-margin-before: 1rem;
            z-index: 2;
            color: #fff;
            background-color: #4680ff;
            border-color: #4680ff;
        }

        .list-group-item.active {
            z-index: 2;
            color: #fff;
            background-color: rgba(233, 234, 238, 0.8);
            border-color: rgba(233, 234, 238, 0.8);
        }
        .list-group {
            border-radius: 0rem!important;
        }

        .city {
            float: left;
            margin: 5px;
            padding: 15px;
            max-width: 300px;
            height: 300px;
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <div class="col-12 " style="">
        <div class="row justify-content-center">
            <!-- Custom Suggestions: Inline -->
            <div class="col-12" style="border-bottom: 2px dashed #4680ff" id="step_1">
                <div class="row m-2">
                    <div class="col-md-2 text-right font-weight-bold selSetTex"></div>
                    <div class="col-md-7" id="lops">
                        <input type="text" class="form-control form-control-sm w-100 settingName" placeholder="...." id="order">
                    </div>
                    <div class="col-md-3">
                        <button type="button" tabindex="3"
                                class="btn btn-sm btn-outline-primary f-w-900 w-75 "
                                style="border-radius: 5px" onclick="sendColumnSettings()">
                            <i class="fas fa-save"></i> <span class="savBtn">Saqlash</span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mt-2" id="step_2">
                <div class="row justify-content-center">
                    <input oninput="OnInput(event)" class="form-control savedSearch" placeholder="Izlash.."/>
                    <div class="listBoxTitle mt-3 w-100"><i class="fas fa-list"/> <span class="setText" data-tour="step: 1; title: Your cart; content: Example cart description text displays cart description">Sozlamalar</span></div>
                    <div class="list-group list-group-flush mt-0 w-100 border" id="myList" role="tablist" style="height: 400px!important; overflow-y: auto!important;">
                    </div>
                </div>
            </div>
            <div class="col-md-6 mt-2 ml-2 border-left border-right border-primary" id="step_3">
                <div class="row justify-content-center dualListSelect">
                    <!-- dual list-->
                </div>
            </div>
            <div class="col-md-2" style="margin-top: 60px">
                <button class="btn btn-sm btn-block btn-outline-primary" onclick="activateSetting()"><i class="fas fa-check"/> <span class="actBtn"></span></button>
                <button class="btn btn-sm btn-block btn-outline-danger" onclick="deleteSetting()"><i class="fas fa-remove-format"/> <span class="delBtn"></span></button>
                <button class="btn btn-sm btn-block btn-outline-info" id="tourbutton" ><i class="fas fa-book-reader"/> <span class="tourBtn"></span></button>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/dual-listbox.js"></script>
    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/tour.js"></script>
    <script type="text/javascript" id="plugin_column_i18" src="${pageContext.servletContext.contextPath}/resources/pages/appV2/js/plugin_column_i18_${sessionLanguage}.js"></script>

    <script>
        var defOptions = [
            {text: appTableV1.ugtk, value: 'ugtk', selected: false},
            {text: appTableV1.g7A, value: 'g7A', selected: false},
            {text: appTableV1.g7B, value: 'g7B', selected: false},
            {text: appTableV1.g7C, value: 'g7C', selected: false},
            {text: appTableV1.g7Ag7Bg7C, value: 'g7Ag7Bg7C', selected: false},
            {text: appTableV1.g1A, value: 'g1A', selected: false},
            {text: appTableV1.g1B, value: 'g1B', selected: false},
            {text: appTableV1.g1Ag1B, value: 'g1Ag1B', selected: false},
            {text: appTableV1.g32, value: 'g32', selected: false},
            {text: appTableV1.g37B, value: 'g37B', selected: false},
            {text: appTableV1.g37C, value: 'g37C', selected: false},
            {text: appTableV1.g2Name, value: 'g2Name', selected: false},
            {text: appTableV1.g8Code2, value: 'g8Code2', selected: false},
            {text: appTableV1.g33, value: 'g33', selected: false},
            {text: appTableV1.g31NameNoIcon, value: 'g31Name', selected: false},
            {text: appTableV1.g15, value: 'g15', selected: false},
            {text: appTableV1.g11, value: 'g11', selected: false},
            {text: appTableV1.vidKontrakta, value: 'vidKontrakta', selected: false},
            {text: appTableV1.g34, value: 'g34', selected: false},
            {text: appTableV1.s34, value: 's34', selected: false},
            {text: appTableV1.g25, value: 'g25', selected: false},
            {text: appTableV1.g20A, value: 'g20A', selected: false},
            {text: appTableV1.g20B, value: 'g20B', selected: false},
            {text: appTableV1.g20Name, value: 'g20Name', selected: false},
            {text: appTableV1.g20Ag20B, value: 'g20Ag20B', selected: false},
            {text: appTableV1.g22A, value: 'g22A', selected: false},
            {text: appTableV1.g45, value: 'g45', selected: false},
            {text: appTableV1.g45Usd, value: 'g45Usd', selected: false},
            {text: appTableV1.g42, value: 'g42', selected: false},
            {text: appTableV1.g42Usd, value: 'g42Usd', selected: false},
            {text: appTableV1.indxusd, value: 'indxusd', selected: false},
            {text: appTableV1.indxusdLn, value: 'indxusdLn', selected: false},
            {text: appTableV1.g45Usded, value: 'g45Usded', selected: false},
            {text: appTableV1.g45UsdedLn, value: 'g45UsdedLn', selected: false},
            {text: appTableV1.g31Marka, value: 'g31Marka', selected: false},
            {text: appTableV1.g35, value: 'g35', selected: false},
            {text: appTableV1.g38, value: 'g38', selected: false},
            {text: appTableV1.g41, value: 'g41', selected: false},
            {text: appTableV1.g43, value: 'g43', selected: false},
            {text: appTableV1.g31Amount, value: 'g31Amount', selected: false},
            {text: appTableV1.vesEd, value: 'vesEd', selected: false},
            {text: appTableV1.gdvipdate, value: 'gdvipdate', selected: false},
            {text: appTableV1.gc3Date, value: 'gc3Date', selected: false},
            {text: appTableV1.metod, value: 'metod', selected: false},
            {text: appTableV1.vzaimosvyaz, value: 'vzaimosvyaz', selected: false},
            {text: appTableV1.idn, value: 'idn', selected: false},
            {text: appTableV1.obl, value: 'obl', selected: false},
            {text: appTableV1.lgot20, value: 'lgot20', selected: false},
            {text: appTableV1.lgot27, value: 'lgot27', selected: false},
            {text: appTableV1.lgot29, value: 'lgot29', selected: false},
            {text: appTableV1.sovstavka, value: 'sovstavka', selected: false},
            {text: appTableV1.asosQiymat, value: 'asosQiymat', selected: false},
            {text: appTableV1.ktd, value: 'ktd', selected: false}
        ]
        var settingLists = null;
        var selectedId = null;
        var dlb4 = null;

        $(document).ready(function () {
            getListSettings()
        })

        function sendColumnSettings() {
            var booleanSelect = false
            var booleanName = true
            dlb4.options.forEach(value => {
                if (value.selected === true){
                    booleanSelect = true;
                }
            })
            if ([undefined, ''].includes($('.settingName').val())){
                booleanName = false;
            }

            if (booleanSelect && booleanName){
                var dataS = {
                  "arrayList": dlb4.options,
                  "settingName": $('.settingName').val()
                };
                $.ajax({
                    type: "POST",
                    data: JSON.stringify(dataS),
                    url: "<%=request.getContextPath()%>/routeV2/V3/data/cost_monitoring_base/v1",
                    dataType: "json",
                    async: true,
                    contentType: 'application/json',
                    beforeSend: function () {
                    },
                    complete: function () {
                        $.toast({
                            position: 'top-right',
                            heading: 'Бажарилди!',
                            text: 'Янги созлама рўйхатингизга сақланди.',
                            icon: 'success',
                            loader: true,        // Change it to false to disable loader
                            loaderBg: '#9EC600'  // To change the background
                        })
                        $('.settingName').html('')
                        getListSettings();
                    }
                });
            }else {
                if (!booleanName && booleanSelect){
                    $.toast({
                        position: 'top-right',
                        heading: 'Диққат хатолик!',
                        text: 'Янги созлама сақлаш учун созлама номини киритишингиз лозим.',
                        icon: 'error',
                        loader: true,        // Change it to false to disable loader
                        loaderBg: '#9EC600'  // To change the background
                    })
                }
                else if (booleanName && !booleanSelect){
                    $.toast({
                        position: 'top-right',
                        heading: 'Диққат хатолик!',
                        text: 'Янги созлама сақлаш учун камида битта устун танланиши лозим.',
                        icon: 'error',
                        loader: true,        // Change it to false to disable loader
                        loaderBg: '#9EC600'  // To change the background
                    })
                }else if(!booleanName && !booleanSelect){
                    $.toast({
                        position: 'top-right',
                        heading: 'Диққат хатолик!',
                        text: 'Янги созлама сақлаш учун камида битта устун танланиши ва созлама номи киритилиши лозим.',
                        icon: 'error',
                        loader: true,        // Change it to false to disable loader
                        loaderBg: '#9EC600'  // To change the background
                    })
                }

            }
        }
        function getListSettings() {
            $.ajax({
                type: "GET",
                // data: JSON.stringify(dataS),
                url: "<%=request.getContextPath()%>/routeV2/V3/data/cost_monitoring_base/v2",
                dataType: "json",
                async: true,
                contentType: 'application/json',
                beforeSend: function () {
                },
                complete: function () {

                },
                success: function (res) {
                    settingLists = res.settings;

                    creatorSettingList()
                },
                error: function (res) {
                }
            });
        }
        function creatorSettingList() {
            $('#myList').html('');
            let idselected = null;
            settingLists.forEach((value, index) => {
                let lists = '';
                if (value.isDefault === 1 || value.id === "1"){
                    if (value.id === "1"){
                        lists = '<a class="list-group-item list-group-item-action d-flex justify-content-between text-warning" id="'+value.id+'" data-toggle="list" onclick="setterColumnToBox('+"'"+value.id+"'"+')" href="#" role="tab"><u>'+value.settingName+'</u></a>';
                    }else if(value.isDefault === 1){
                        lists = '<a class="list-group-item list-group-item-action d-flex justify-content-between active text-primary" id="'+value.id+'" data-toggle="list"  onclick="setterColumnToBox('+"'"+value.id+"'"+')" href="#" role="tab"><u>'+value.settingName+'</u> <i class="fas fa-check-double"></i></a>';
                        idselected = value.id
                    }
                }else {
                    lists = '<a class="list-group-item list-group-item-action text-primary" data-toggle="list" id="'+value.id+'" onclick="setterColumnToBox('+"'"+value.id+"'"+')" href="#" role="tab">'+value.settingName+'</a>';
                }
                $('#myList').append(lists)
            })
            if (idselected===null) {
                setterColumnToBox('1')
                $('#1').append('<i class="fas fa-check-double"></i>')
            }else {
                setterColumnToBox(idselected)
            }
        }
        function setterColumnToBox(id){
            selectedId = id;
            $('.dualListSelect').html('');
            let sel = '<select multiple="multiple" id="dualList" class="dualList"> </select>';
            $('.dualListSelect').html(sel);
            var optList = null;
            settingLists.forEach((value, key) => {
                if (value.id === id){
                    optList = value.selected;
                }
            })
            defOptions = [
                {text: appTableV1.ugtk, value: 'ugtk', selected: optList.find(element => element.value === 'ugtk').selected},
                {text: appTableV1.g7A, value: 'g7A', selected: optList.find(element => element.value === 'g7A').selected},
                {text: appTableV1.g7B, value: 'g7B', selected: optList.find(element => element.value === 'g7B').selected},
                {text: appTableV1.g7C, value: 'g7C', selected: optList.find(element => element.value === 'g7C').selected},
                {text: appTableV1.g7Ag7Bg7C, value: 'g7Ag7Bg7C', selected:optList.find(element => element.value === 'g7Ag7Bg7C').selected},
                {text: appTableV1.g1A, value: 'g1A', selected: optList.find(element => element.value === 'g1A').selected},
                {text: appTableV1.g1B, value: 'g1B', selected: optList.find(element => element.value === 'g1B').selected},
                {text: appTableV1.g1Ag1B, value: 'g1Ag1B', selected:optList.find(element => element.value === 'g1Ag1B').selected},
                {text: appTableV1.g32, value: 'g32', selected: optList.find(element => element.value === 'g32').selected},
                {text: appTableV1.g37B, value: 'g37B', selected:optList.find(element => element.value === 'g37B').selected},
                {text: appTableV1.g37C, value: 'g37C', selected:optList.find(element => element.value === 'g37C').selected},
                {text: appTableV1.g2Name, value: 'g2Name', selected:optList.find(element => element.value === 'g2Name').selected},
                {text: appTableV1.g8Code2, value: 'g8Code2', selected:optList.find(element => element.value === 'g8Code2').selected},
                {text: appTableV1.g33, value: 'g33', selected: optList.find(element => element.value === 'g33').selected},
                {text: appTableV1.g31NameNoIcon, value: 'g31Name', selected:optList.find(element => element.value === 'g31Name').selected},
                {text: appTableV1.g15, value: 'g15', selected: optList.find(element => element.value === 'g15').selected},
                {text: appTableV1.g11, value: 'g11', selected: optList.find(element => element.value === 'g11').selected},
                {text: appTableV1.vidKontrakta, value: 'vidKontrakta', selected:optList.find(element => element.value === 'vidKontrakta').selected},
                {text: appTableV1.g34, value: 'g34', selected: optList.find(element => element.value === 'g34').selected},
                {text: appTableV1.s34, value: 's34', selected: optList.find(element => element.value === 's34').selected},
                {text: appTableV1.g25, value: 'g25', selected: optList.find(element => element.value === 'g25').selected},
                {text: appTableV1.g20A, value: 'g20A', selected:optList.find(element => element.value === 'g20A').selected},
                {text: appTableV1.g20B, value: 'g20B', selected:optList.find(element => element.value === 'g20B').selected},
                {text: appTableV1.g20Name, value: 'g20Name', selected:optList.find(element => element.value === 'g20Name').selected},
                {text: appTableV1.g20Ag20B, value: 'g20Ag20B', selected:optList.find(element => element.value === 'g20Ag20B').selected},
                {text: appTableV1.g22A, value: 'g22A', selected:optList.find(element => element.value === 'g22A').selected},
                {text: appTableV1.g45, value: 'g45', selected: optList.find(element => element.value === 'g45').selected},
                {text: appTableV1.g45Usd, value: 'g45Usd', selected:optList.find(element => element.value === 'g45Usd').selected},
                {text: appTableV1.g42, value: 'g42', selected: optList.find(element => element.value === 'g42').selected},
                {text: appTableV1.g42Usd, value: 'g42Usd', selected:optList.find(element => element.value === 'g42Usd').selected},
                {text: appTableV1.indxusd, value: 'indxusd', selected:optList.find(element => element.value === 'indxusd').selected},
                {text: appTableV1.indxusdLn, value: 'indxusdLn', selected:optList.find(element => element.value === 'indxusdLn').selected},
                {text: appTableV1.g45Usded, value: 'g45Usded', selected:optList.find(element => element.value === 'g45Usded').selected},
                {text: appTableV1.g45UsdedLn, value: 'g45UsdedLn', selected:optList.find(element => element.value === 'g45UsdedLn').selected},
                {text: appTableV1.g31Marka, value: 'g31Marka', selected:optList.find(element => element.value === 'g31Marka').selected},
                {text: appTableV1.g35, value: 'g35', selected: optList.find(element => element.value === 'g35').selected},
                {text: appTableV1.g38, value: 'g38', selected: optList.find(element => element.value === 'g38').selected},
                {text: appTableV1.g41, value: 'g41', selected: optList.find(element => element.value === 'g41').selected},
                {text: appTableV1.g43, value: 'g43', selected: optList.find(element => element.value === 'g43').selected},
                {text: appTableV1.g31Amount, value: 'g31Amount', selected:optList.find(element => element.value === 'g31Amount').selected},
                {text: appTableV1.vesEd, value: 'vesEd', selected:optList.find(element => element.value === 'vesEd').selected},
                {text: appTableV1.gdvipdate, value: 'gdvipdate', selected:optList.find(element => element.value === 'gdvipdate').selected},
                {text: appTableV1.gc3Date, value: 'gc3Date', selected:optList.find(element => element.value === 'gc3Date').selected},
                {text: appTableV1.metod, value: 'metod', selected:optList.find(element => element.value === 'metod').selected},
                {text: appTableV1.vzaimosvyaz, value: 'vzaimosvyaz', selected:optList.find(element => element.value === 'vzaimosvyaz').selected},
                {text: appTableV1.idn, value: 'idn', selected: optList.find(element => element.value === 'idn').selected},
                {text: appTableV1.obl, value: 'obl', selected: optList.find(element => element.value === 'obl').selected},
                {text: appTableV1.lgot20, value: 'lgot20', selected:optList.find(element => element.value === 'lgot20').selected},
                {text: appTableV1.lgot27, value: 'lgot27', selected:optList.find(element => element.value === 'lgot27').selected},
                {text: appTableV1.lgot29, value: 'lgot29', selected:optList.find(element => element.value === 'lgot29').selected},
                {text: appTableV1.sovstavka, value: 'sovstavka', selected:optList.find(element => element.value === 'sovstavka').selected},
                {text: appTableV1.asosQiymat, value: 'asosQiymat', selected:optList.find(element => element.value === 'asosQiymat').selected},
                {text: appTableV1.ktd, value: 'ktd', selected: optList.find(element => element.value === 'ktd').selected}
            ]

            setTimeout(() => {
                  dlb4 =  new DualListbox('.dualList', {
                    showSortButtons: false,
                    availableTitle: appTableV1Setting.availableTitle,
                    selectedTitle: appTableV1Setting.selectedTitle,
                    searchPlaceholder: appTableV1Setting.searchPlaceholder,
                    addAllButtonText: '<i class="fas fa-indent" aria-hidden="true"></i>',
                    addButtonText: '<i class="fas fa-long-arrow-alt-right" aria-hidden="true"></i>',
                    removeButtonText: '<i class="fas fa-long-arrow-alt-left" aria-hidden="true"></i>',
                    removeAllButtonText: '<i class="fas fa-outdent" aria-hidden="true"></i>',
                    options: defOptions
                });


                $('.dual-listbox__search').addClass('form-control')
                $('.dual-listbox__button').addClass('btn btn-outline-primary')
                $('.selSetTex').html(appTableV1Setting.columnSettingNames+ ' :')
                $('.savBtn').html(appTableV1Setting.saveSetting)
                $('.savedSearch').attr("placeholder", appTableV1Setting.searchPlaceholder)
                $('.setText').html(appTableV1Setting.settingsList)
                $('.actBtn').html(appTableV1Setting.activeSetting)
                $('.delBtn').html(appTableV1Setting.deleteSetting)
                $('.tourBtn').html(appTableV1Setting.tourBtnText)
            }, 0);
        }
        function activateSetting() {
            var settingNm = $('.settingName').val();
            var dataS = {
                "id": selectedId,
                "arrayList": dlb4.options,
                "settingName":  settingNm,
            };
            $.ajax({
                type: "PUT",
                data: JSON.stringify(dataS),
                url: "<%=request.getContextPath()%>/routeV2/V3/data/cost_monitoring_base/v1",
                dataType: "json",
                async: true,
                contentType: 'application/json',
                beforeSend: function () {
                },
                complete: function () {
                    $.toast({
                        position: 'top-right',
                        heading: 'Бажарилди!',
                        text: 'Созлама танланди (Жадвал устунлари янгиланди).',
                        icon: 'success',
                        loader: true,        // Change it to false to disable loader
                        loaderBg: '#9EC600'  // To change the background
                    })
                    setTimeout(() => {
                        if (![undefined, '', null].includes(settingNm) && selectedId==="1"){
                            $.toast({
                                position: 'top-right',
                                heading: 'Тақиқланган!',
                                text: 'Танланган созламага киритилган ном ушбу созламага тадбиқ этилмайди.',
                                icon: 'warning',
                                loader: true,        // Change it to false to disable loader
                                loaderBg: '#9EC600'  // To change the background
                            })
                        }
                    }, 800);
                    $('.settingName').html('')
                    getListSettings();
                    fisibatoreColumnsAfter();
                }
            });
        }
        function deleteSetting() {
            var dataS = {
                "id": selectedId
            };
            if (selectedId === "1"){
                $.toast({
                    position: 'top-right',
                    heading: 'Тақиқланган амал!',
                    text: 'Ушбу созлама умумий бўлганлиги учун ўчириш имкони мавжуд эмас.',
                    icon: 'error',
                    loader: true,        // Change it to false to disable loader
                    loaderBg: '#9EC600'  // To change the background
                })
                return;
            }
            $.ajax({
                type: "DELETE",
                data: JSON.stringify(dataS),
                url: "<%=request.getContextPath()%>/routeV2/V3/data/cost_monitoring_base/v1",
                dataType: "json",
                async: true,
                contentType: 'application/json',
                beforeSend: function () {
                },
                complete: function () {
                    $.toast({
                        position: 'top-right',
                        heading: 'Бажарилди!',
                        text: 'Танланган созлама сизнинг рўйхатингиздан ўчирилди.',
                        icon: 'success',
                        loader: true,        // Change it to false to disable loader
                        loaderBg: '#9EC600'  // To change the background
                    })
                    $('.settingName').html('')
                    getListSettings();
                    fisibatoreColumnsAfter();
                }
            });
        }

        $('#myList a').on('click', function (e) {
            e.preventDefault()
            console.log(e.preventDefault())
            console.log(e)
            console.log($(this).tab('show'))
        })
        function OnInput() {

        }

    </script>
    <script>
        const wt = new WebTour();

        const steps = [
            {
                element: '#step_1',
                title: 'Popover title',
                content: 'Popover content',
                placement: 'right-start',
            },
            {
                element: '#step_2',
                title: 'Popover title',
                content: 'Popover content',
                placement: 'right-start',
            },
            {
                element: '#step_3',
                title: 'Popover title',
                content: 'Popover content',
                placement: 'right-start',
            },
        ];

        $('#tourbutton').on('click', function () {
            wt.highlight('#target');
            wt.setSteps(steps);
            wt.start();
        })
    </script>
</body>

