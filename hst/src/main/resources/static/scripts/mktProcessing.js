
$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		/* For Select Box */
		var self_ = $('[name=' + this.name + ']');
		if (self_.is('select')) {
			this.value = common.getSelectBoxObject(this);
		}

		if (self_.hasClass("format-currency")) {
			this.value = self_.currency();
		}

		o[this.name] = this.value || '';

	});
	return o;
};


var actionIn;
var rcmcReqIdIn;
var fileNoSearchinterOffice;

/*
$(document).ready(function() {
	$("#div_refund").hide();
	$("#newAccountdetails").hide();
	$('#feepayment').hide();

}());*/
$(document).ready(function() {
	progressBar.build();
	var transactionId = $("#MainSummaryId").length;
	if (transactionId == 1) {
		/*cmApplicationDetialsandIECnumber.bindResponse();*/
	} else {
/*		cmCategoryunderwhichrefund.bindResponse();
*/	}
	common.showError();
	/*refundDetails.showApplyBtn();*/

});
//$('#epcOfficer').change(function(){
//    var personID=$(this).find(':selected').data('person');
//    console.log(personID);
//});

$(document).ready(function() {
	loadAuthDetailsTbl();
	rcmc_list_manage_tab.rcmc_list_manage_table();
	loadRcmcOthPmtTbl();
	
});


var rcmc_list_manage_tab = (function() {

	$('.custom-datatable').css('width', '100%');
	var rcmc_manage_tbl = null;
	var rcmc_list_manage_table = function() {
		rcmc_manage_tbl = $('#RCMCSearchList')
				.DataTable(
						{
							dom : "Bfrtip",
							searching : true,
							info : true,
							serverSide: false,
							processing: true,
							buttons : [
								{
									extend: 'excel',
									exportOptions: {
				                                    columns: "thead th:not(.noExport)"
				                         },
				                    text: function ( dt, button, config ) {
						                return dt.i18n( 'buttons.excel', 'Excel' );
						            },
						            filename: 'Worklist',
						            title: 'Worklist',
								}
								],
							"columns" : [

								
										
									{
										"data" : "iecId",
										className : "editable"
									},
									{
										"data" : "firmName",
										className : "editable"
									},
									{
										"data" : "fileDate",
										className : "editable"
									},
									{
										"data" : "fileNo",
										className : "editable"
									},
									{
										"data" : "rcmcNumber",
										className : "editable"
									},

									
									{
										"data" : "applicationType_Value",
										className : "editable"
									},
									

									{
										"data" : "status_Value",
										className : "editable"
									},

									{
										"data" : "pendingWith",
										className : "editable"
									},

									
									
									{
										"data" : "epcOffice_Value",
										className : "editable",
										
									},{
										"data" : "action",
										className : "editable",
										
									}
								
							],
							"columnDefs" : [
				        	
				            {
				                responsivePriority : 2,
				                targets : -1
				            }, {
				                "defaultContent" : "-",
				                "targets" : "_all"
				            },
				             {"targets":2, "type":"de_datetime"},
				       ],
				       "order" : [ [ 2,"desc"]]
				    
						
						});
	};
	var getRcmcmanagetbl = function() {
		return rcmc_manage_tbl;
	}
	return {
		getRcmcmanagetbl : getRcmcmanagetbl,
		rcmc_list_manage_table : rcmc_list_manage_table
	}
})();



/*View File History*/

function viewFileHistory(fileNo,fileId,appId) {

	
	var url = 'web?requestType=ApplicationRH&actionVal=viewFileHistoryAction&screenId=9000012381&appId=307000004&fileNo=';
	url += fileNo+"&fileId=";
	url+=fileId;
	
	
	updateContainer(url);


}







$(document).ready(function() {

	rcmc_view_file_tab.rcmc_view_file_table();

});


var rcmc_view_file_tab = (function() {
	$('.custom-datatable').css('width', '100%');
	var rcmc_view_file_tbl = null;
	var rcmc_view_file_table = function() {
		rcmc_view_file_tbl = $('#viewFileHistoryRCMC')
				.DataTable(
						{	
							"scrollX" : true,
							bFilter : false,
							ordering : false,
							"order" : [],
						
							 "paging": true,  
							 "pageLength": 10,

							"columns" : [
	{
										'targets' : 0,
										'searchable' : false,
										'orderable' : true,
										'className' : 'dt-body-center',
										"data" : "S.No.",
										className : "editable"
										
									},
									{
										"data" : "fileDate",
										className : "editable"
									},
									{
										"data" : "Action",
										className : "editable"
									},
									{
										"data" : "userFrom",
										className : "editable"
									},
									{
										"data" : "userTo",
										className : "editable"
									},
									{
										"data" : "Remarks",
										className : "editable"
									},

									{
										"data" : "Attachments",
										className : "editable",
									},

									

									
								
							],
						
						});
	};
	var getRcmcviewfiletbl = function() {
		return rcmc_view_file_tbl;
	}
	return {
		getRcmcviewfiletbl : getRcmcviewfiletbl,
		rcmc_view_file_table : rcmc_view_file_table
	}
})();

var clearSearch = function() {
	$('input').val("");
	$('select').prop('selectedIndex',0);
var jsonClear={};
	updateContainer( 'web?requestType=ApplicationRH&actionVal=RCMCProcessingPage&screenId=9000012381',jsonClear);

}

var backToRcmcSearch = function() {
	debugger;
	var jsonClear={};
	jsonClear.form=$("#backToWorklist1").val();
	jsonClear.navigateFrom="standard";
	updateContainer( 'web?requestType=ApplicationRH&actionVal=RCMCSearch&screenId=9000012381',jsonClear,null, false,function(){
		var tmp = JSON.parse(jsonClear.form);
		$("#epcOffice").val(tmp.officeIds).trigger("chosen:updated");
	});
}





function getTableData() {
	var respoDefi=$(".DeficiencyRespond").prop("checked");
	var flag = true;
	var serachArray;
	if(respoDefi==true){
		serachArray= ["respondFromDate","respondToDate"];
		if (common.isValid(serachArray)) {
			flag = false;
			return false;
		}
	}
	if (flag) {
		var json = buildSearchParam()
		updateContainer( 'web?requestType=ApplicationRH&actionVal=RCMCSearch&screenId=9000012381',json,null, false,function(){
				var tmp = JSON.parse(json.form);
				$("#epcOffice").val(tmp.officeIds).trigger("chosen:updated");
			});
	}
}
function buildSearchParam() {
	var dataJson = {};
	var json = {};
	dataJson=$('#txnSearchFilter').find("input,select,textarea").serializeObject();
	var iterable=dataJson.epcOffice;
	var tmp = [];
	if(iterable!=null && iterable !==""){ 
		for(var office of dataJson.epcOffice){
			if(office.key!=-1)
				tmp.push(office.key);
		}
	}
	$("#epcOffice").val(tmp).trigger("chosen:updated");
	dataJson.officeIds= tmp;
	dataJson.epcOffice = {};
	if($("#globalEPCId").length > 0) {
		dataJson.epcId = $("#globalEPCId").val();
	}
	
	json.navigateFrom="standard";
	json.form = JSON.stringify(dataJson);
	return json;
	
}
function viewiec(iecid) {
	
	if (iecid === undefined) {
		bootbox.alert("Please Select Valid..");
	} else {

		var url = 'web?requestType=ApplicationRH&actionVal=viewiec&screenId=9000012381&iecId=';
		url += iecid;
		updateContainer(url);
	}

}
function fileDataRCMC(fileNo) {
	
	var url = 'web?requestType=ApplicationRH&actionVal=RCMCDataAction&screenId=9000012381&fileNo=';
	url += fileNo;
		
	if($("#globalEPCId").length > 0) {
		url += "&epcId=" + $("#globalEPCId").val();
	}
	var serachParam = buildSearchParam();
	updateContainer(url,serachParam);	
	loadAuthDetailsTbl();
	loadRcmcOthPmtTbl();
}

function rcmcDefiAmountPayFn()
{
	var pay=$(".DeficiencyAmount").prop("checked");
	if(pay==true){
		$("#extraAmountYes").removeClass('d-none');
		$("#extraAmountNote").removeClass('d-none');
		
	}else{
		$("#amount").val("0");
		$("#extraAmountYes").addClass('d-none');
		$("#extraAmountNote").addClass('d-none');
	}
	

}

function rcmcRespoDefiFn()
{
	var respondYes=$(".DeficiencyRespond").prop("checked");
	if(respondYes==true){
		$("#defIRespondDate").removeClass('d-none');
	}else{
		
		$("#defIRespondDate").addClass('d-none');
	}
	

}



function reload()
{
	
	var url = 'web?requestType=ApplicationRH&actionVal=RCMCProcessingPage&screenId=9000012381';
	
	updateContainer(url);
	
}



var reloadWorklist = function(fileNoSearch){
	
var jsonPull={};
var dataJsonactionPull = {};

dataJsonactionPull.fileNo=fileNoSearch;
dataJsonactionPull.rcmcDefiRespond='0';
jsonPull.navigateFrom="standard";
jsonPull.form = JSON.stringify(dataJsonactionPull);
	console.log(jsonPull);
		updateContainer( 'web?requestType=ApplicationRH&actionVal=RCMCSearch&screenId=9000012381',jsonPull);
}

$(document).ready(function() {
	if ($("#myDIV2").length > 0 ) {
	var ya = document.getElementById("myDIV2");
	ya.style.display = "none";
	var yb = document.getElementById("myDIV3");
	yb.style.display = "none";
	var yc = document.getElementById("myDIV4");
	yc.style.display = "none";
	var yd = document.getElementById("myDIV5");
	yd.style.display = "none";

	var ye = document.getElementById("myDIV8");
	ye.style.display = "none";
	var yf = document.getElementById("myDIV7");
	yf.style.display = "none";
	}
	
});





$(document).ready(function() {

$("#countryList").chosen();
$("#numberOfYearSelect").chosen();
$("#additionalBranch").chosen();
var json = {};
if($("#moduleJson").val() != "") {
	json.rcmcForm = JSON.parse($("#moduleJson").val());
}
var processingJson ={};
if($("#processingJson").val() != "") {
	processingJson.rcmcForm = JSON.parse($("#processingJson").val());
}



if (json.rcmcForm != null && json.rcmcForm!=="" && json.rcmcForm.rcmcDetailsRCMCDTO!==null && json.rcmcForm.rcmcDetailsRCMCDTO.rcmcOtherInformationDTO!=null) {
	try {
		
		let selectedSector = json.rcmcForm.rcmcDetailsRCMCDTO.rcmcOtherInformationDTO.countryList;
		let ids = [];
		selectedSector.forEach(function(obj, i) {
			ids.push(obj.key);
		});
		$("#countryList").val(ids).trigger("chosen:updated");
	} catch (e) {
		console.log(e);
	}
}

if (processingJson.rcmcForm != null && processingJson.rcmcForm!=="" && processingJson.rcmcForm.rcmcCertificateDTO!==null  && processingJson.rcmcForm.rcmcCertificateDTO.numberOfYearSelect!=null) {
	debugger;
	try {		
		let selectedSector = processingJson.rcmcForm.rcmcCertificateDTO.numberOfYearSelect;
		let numberYear = [];
		selectedSector.forEach(function(obj, i) {
			numberYear.push(obj.key);
		});
		$("#numberOfYearSelect").val(numberYear).trigger("chosen:updated");
		
		
		
		
	} catch (e) {
		console.log(e);
	}
}

if (processingJson.rcmcForm != null && processingJson.rcmcForm!=="" && processingJson.rcmcForm.rcmcCertificateDTO!==null  && processingJson.rcmcForm.rcmcCertificateDTO.additionalBranch!=null) {
	debugger;
	try {
		let selectedSector = processingJson.rcmcForm.rcmcCertificateDTO.additionalBranch;
		debugger;
		let additionalBranchesSelect = [];
		selectedSector.forEach(function(obj, i) {
			additionalBranchesSelect.push(obj.key);
		});
		$("#additionalBranch").val(additionalBranchesSelect).trigger("chosen:updated");
		
		
		
		
	} catch (e) {
		console.log(e);
	}
}

});





$(document).ready(function() {

	var navigation=$("#navigateFrom").val();
	
		$("#epcOffice").chosen();

	if(navigation==="dashboard"){
		
		var officeList=$("#selectedOffices").val();
		console.log(officeList);
		var offices=JSON.parse(officeList);
		//console.log(officeList);
		var officeIds=[];
		for(var office of offices){
			if(office!=-1)
				officeIds.push(office);
		}
		console.log(officeIds);
		$("#epcOffice").val(officeIds).trigger("chosen:updated");
		//updateContainer( 'web?requestType=ApplicationRH&actionVal=RCMCSearch&screenId=9000012381',json);

		}
	
	common.applyCurrencyFormat();
	
	
});





function myFunction(id) {
	
	if(id=="myDIV1"){
		var xa = document.getElementById("myDIV2");
		xa.style.display = "none";
		var xb = document.getElementById("myDIV3");
		xb.style.display = "none";
		var xc = document.getElementById("myDIV4");
		xc.style.display = "none";
		var xd= document.getElementById("myDIV5");
		xd.style.display = "none";
		var xe = document.getElementById("myDIV6");
		xe.style.display = "none";
		var xf = document.getElementById("myDIV7");
		xf.style.display = "none";
		var xg = document.getElementById("myDIV8");
		xg.style.display = "none";
		
		
	}	
		else if(id=="myDIV2"){
		getTotalFee();
		var qa = document.getElementById("myDIV1");
		qa.style.display = "none";
		var qb = document.getElementById("myDIV3");
		qb.style.display = "none";
		var qc = document.getElementById("myDIV4");
		qc.style.display = "none";
		var qd= document.getElementById("myDIV5");
		qd.style.display = "none";
		var qe = document.getElementById("myDIV6");
		qe.style.display = "none";
		var qf = document.getElementById("myDIV7");
		qf.style.display = "none";
		var qg = document.getElementById("myDIV8");
		qg.style.display = "none";
		
	}	
	
		else if(id=="myDIV3"){
		var la = document.getElementById("myDIV2");
		la.style.display = "none";
		var lb = document.getElementById("myDIV1");
		lb.style.display = "none";
		var lc = document.getElementById("myDIV4");
		lc.style.display = "none";
		var ld= document.getElementById("myDIV5");
		ld.style.display = "none";
		var le = document.getElementById("myDIV6");
		le.style.display = "none";
		var lf = document.getElementById("myDIV7");
		lf.style.display = "none";
		var lg = document.getElementById("myDIV8");
		lg.style.display = "none";
		
	}	
	
	
		else if(id=="myDIV4"){
		var ga = document.getElementById("myDIV2");
		ga.style.display = "none";
		var gb = document.getElementById("myDIV3");
		gb.style.display = "none";
		var gc = document.getElementById("myDIV1");
		gc.style.display = "none";
		var gd= document.getElementById("myDIV5");
		gd.style.display = "none";
		var ge = document.getElementById("myDIV6");
		ge.style.display = "none";
		var gf = document.getElementById("myDIV7");
		gf.style.display = "none";
		var gg = document.getElementById("myDIV8");
		gg.style.display = "none";
		
	}	
	
		
		else if(id=="myDIV5"){
		var fa = document.getElementById("myDIV2");
		fa.style.display = "none";
		var fb = document.getElementById("myDIV3");
		fb.style.display = "none";
		var fc = document.getElementById("myDIV4");
		fc.style.display = "none";
		var fd= document.getElementById("myDIV1");
		fd.style.display = "none";
		var fe = document.getElementById("myDIV6");
		fe.style.display = "none";
		var ff = document.getElementById("myDIV7");
		ff.style.display = "none";
		var fg = document.getElementById("myDIV8");
		fg.style.display = "none";
		
	}	
	
		else if(id=="myDIV6"){
		var ca = document.getElementById("myDIV2");
		ca.style.display = "none";
		var cb = document.getElementById("myDIV3");
		cb.style.display = "none";
		var cc = document.getElementById("myDIV4");
		cc.style.display = "none";
		var cd= document.getElementById("myDIV5");
		cd.style.display = "none";
		var ce = document.getElementById("myDIV1");
		ce.style.display = "none";
		var cf = document.getElementById("myDIV7");
		cf.style.display = "none";
		var cg = document.getElementById("myDIV8");
		cg.style.display = "none";
		
	}	
	
	
		else if(id=="myDIV7"){
		var ha = document.getElementById("myDIV2");
		ha.style.display = "none";
		var hb = document.getElementById("myDIV3");
		hb.style.display = "none";
		var hc = document.getElementById("myDIV4");
		hc.style.display = "none";
		var hd= document.getElementById("myDIV5");
		hd.style.display = "none";
		var he = document.getElementById("myDIV6");
		he.style.display = "none";
		var hf = document.getElementById("myDIV1");
		hf.style.display = "none";
		var hg = document.getElementById("myDIV8");
		hg.style.display = "none";
		
	}	
	
		else if(id=="myDIV8"){
		var ra = document.getElementById("myDIV2");
		ra.style.display = "none";
		var rb = document.getElementById("myDIV3");
		rb.style.display = "none";
		var rc = document.getElementById("myDIV4");
		rc.style.display = "none";
		var rd= document.getElementById("myDIV5");
		rd.style.display = "none";
		var re = document.getElementById("myDIV6");
		re.style.display = "none";
		var rf = document.getElementById("myDIV7");
		rf.style.display = "none";
		var rg = document.getElementById("myDIV1");
		rg.style.display = "none";
		
		
	}	
	  var x = document.getElementById(id);
	  if (x.style.display == "none") {
	    x.style.display = "block";
	  } 

	  $("html, body").animate({
		  scrollTop : 0
		  }, "slow");
};

var buildPrintCertificate = function(act) {
	var fileIdval=$('#fileID').val();
	var flieNo = $("#fileNo").val();
	var appId = $("#appIdRCMC").val();
	var url = 'web?requestType=ApplicationRH&actionVal='+act+'&screenId=9000012381&fileId=';
	url += fileIdval+"&fileNumber="+flieNo+"&appIdRCMC="+appId;
	
	return url;
}

var printCertificate = function() {
	var url = buildPrintCertificate("printCertificate");
	ajax.request(url,null, "rcmcDownloadcertificateDiv" );
}

var printCertificateWithSign = function(printCallback) {
	var url = buildPrintCertificate("printCertificateWithSign");
	ajax.post(url,null, printCallback );
}

var certificateSignAndSubmit = function() {
	var url = buildPrintCertificate("fetchCertificateData");
	ajax.post(url, null,  function(res) {
		if(res.status == true) {
			if ($("#signAndSubmit").val() == 'YES') {
				$('#certPrevModal').modal('hide');
				$("#dscIsPdfType").val("true");
				signPdf(res.data, $("#fileNo").val(),'425~100~545~160',callbackDigiSign);
			} else {
				callbackDigiSign();
			}
		} else {
			bootbox.alert("unable to sign certificate please contanct helpdesk");
		}
	});
}

/** After Sign Call back Update to MST data */
var callbackDigiSign = function() {
		
	var flieNo = $("#fileNo").val();
	var draftId = $("#draftId").val();
	var signJson = {};
	signJson.fileNumber = flieNo;
	signJson.draftId = draftId;
	signJson.fileId = $("#fileID").val();
	signJson.isRegenCert = $("#isRegenCert").val();
	var url = 'web?requestType=ApplicationRH&actionVal=finalApprval&screenId=9000012381';
	//	ajax.request(url,null, "rcmcDownloadcertificateDiv");
		
	ajax.post(url,signJson,function(res){
		console.log(res.fileNumberSuccess);
		if (res.fileIdSuccess =="Success" && res.fileNumberSuccess =="Success" ){
			bootbox.alert("The file has been approved successfully.");
			reload();
		} else if (res.fileIdSuccessDSC =="3"){
	    	 bootbox.alert("Please first sign your certificate properly.");
	    	 reload();
		} else {
			bootbox.alert("The file has not been approved. Please try again");
			reload();
		}
	});
}
/** After Sign download Certificate */

/** After Sign download Certificate */
var downloadCertificcateWithDSC = function(flieNo) {
	
	if(flieNo == undefined) {
		fileId = $("#fileID").val();
		appId=$("#appIdRCMC").val();

		
		
	}
	var url = 'web?requestType=ApplicationRH&actionVal=printDSCCertificat&screenId=9000012381&fileId='+fileId+'&appId='+appId;
		ajax.request(url,null, "rcmcDownloadcertificateDiv");
		
}
var TestcertificateSignAndSubmit=function() {
	var fileIdval = $('#fileID').val();
	var flieNo = $("#fileNo").val();
	var url = 'web?requestType=ApplicationRH&actionVal=printCertificate&screenId=9000012381&appId=307000004&fileId=';
	url += fileIdval+"&fileNumber="+flieNo;
	ajax.request(url,null, "rcmcDownloadcertificateDiv", callbackPrintCertificaten);
}
var showActionmodal = function(inAction){
	var flag =true;
	if(inAction=="Approve"){
	//$('#showApproveModal').modal('show');
		if($("#declaration").length > 0 && !$("#declaration").is(':checked'))
		{
			 bootbox.alert("Please tick the checkbox under 'Details to be printed in RCMC Certificate' and save certificate details.");
			$('.declarationCheckId').after('<span class="error-msg">This is a mandatory field</span>');
			
			return false;
		}
	var savedCheck=	$("#isCertFieldEditable").val();
	if($("#isCertFieldEditable").length > 0 && savedCheck!=1){
		 bootbox.alert("Please save certificate details under 'Details to be printed in RCMC Certificate'");
			
			return false;
	}
	if(flag){
		$('#showApproveModal').modal({
	    backdrop: 'static',
	    keyboard: false
	});}
	
	actionIn=inAction;}
	else if(inAction=="reject"){
		//$('#showRejectModal').modal('show');
		$('#showRejectModal').modal({
		    backdrop: 'static',
		    keyboard: false
		});
		actionIn=inAction;}
	else if(inAction=="Send"){
		$('#showSendModal').modal({
		    backdrop: 'static',
		    keyboard: false
		});
		//$('#showSendModal').modal('show');
		actionIn=inAction;}
	else if(inAction=="interOfficeTransfer"){
	//	$('#showinterOfficeTransferModal').modal('show');
		$('#showinterOfficeTransferModal').modal({
		    backdrop: 'static',
		    keyboard: false
		});
		actionIn=inAction;}
	else if(inAction=="MarkDeficient"){
	//	$('#showMarkDeficientModal').modal('show');
		$('#showMarkDeficientModal').modal({
		    backdrop: 'static',
		    keyboard: false
		});
		actionIn=inAction;}
		
    }

var showSendModalIn=function(){
	//$('#showSendModal').modal('show');
	$('#showSendModal').modal({
	    backdrop: 'static',
	    keyboard: false
	});
	}

var showinterOfficeTransferModalWorklistIn=function(rcmcReqId,fileNoSearchIn){
//	$('#showinterOfficeTransferModal').modal('show');
	$('#showinterOfficeTransferModal').modal({
	    backdrop: 'static',
	    keyboard: false
	});
	rcmcReqIdIn=rcmcReqId;
	fileNoSearchinterOffice=fileNoSearchIn;
}


var showinterOfficeTransferModalProcessIn=function(){
//	$('#showinterOfficeTransferModal').modal('show');
	$('#showinterOfficeTransferModal').modal({
	    backdrop: 'static',
	    keyboard: false
	});
	rcmcReqIdIn=$('#rcmcReqId').val();
}


	
var displaydetails = function(id) {
	if (id == '1') {
		$('#newAccountdetails').show();
	} else {
		$('#newAccountdetails').hide();

	}
};



	var fileActionApproveReject = function(){
		
	
	
	$('#showMarkDeficientModal').modal('hide');
	$('#showSendModal').modal('hide');
	$('#showRejectModal').modal('hide');
	$('#showinterOfficeTransferModal').modal('hide');
	
	var flag = true;
	var array = [ "Remarks"];
	
	
	if (common.isValid(array)) {
		flag = false;
	}
		

	if(flag==true){
		$('#showApproveModal').modal('hide');
	var iEC_Status=$('#iEC_Status').val();
	if(iEC_Status=="1"){
	var json={};
	var dataJsonaction = {};
	
	
	dataJsonaction.RCMCActionUpdateDTO={};

	dataJsonaction.RCMCActionUpdateDTO.remarks=$('#Remarks').val();
	dataJsonaction.RCMCActionUpdateDTO.action=actionIn;
	dataJsonaction.RCMCActionUpdateDTO.fileNo=$('#fileNo').val();
	dataJsonaction.RCMCActionUpdateDTO.toUser=$('#applicantName').val();
	
	
	if (actionIn == "Approve" && isCertChange()) {
		var certDto = {};
		certDto.validUpto = $("#certValidUpto").val();
		certDto.goodsDesc = $("#certGoodsDesc").val();
		
		dataJsonaction.RCMCActionUpdateDTO.rcmcCertificateDTO = certDto;
	}
	
	
		dataJsonaction.RCMCActionUpdateDTO = JSON.stringify(dataJsonaction.RCMCActionUpdateDTO);
		ajax.post("web?requestType=ApplicationRH&actionVal=approveReject&screenId=9000012381",dataJsonaction,function(res){
			if (res.fileIdSuccess =="Success" && res.fileNumberSuccess =="Success" ){
				if ($("#appIdRCMC").val() == 307000005 || $("#appIdRCMC").val() == 307000006) {
					bootbox.alert("The file has been approved successfully. You may proceed to issue the RCMC letter to complete the process");
				} else {
					bootbox.alert("The file has been approved successfully. You may proceed to issue the RCMC certificate to complete the process");
				}
	    	 	reload();
			} else if (res.fileIdSuccess =="iecInActive" && res.fileNumberSuccess =="iecInActive" ){
				bootbox.alert("This file cannot be approved. As IEC is not active.");
			} else {
				bootbox.alert("The file has not been approved. Please try again");
				reload();
			}
		});

	}
	else
	{
	 bootbox.alert("This file cannot be approved. As IEC is not active.");
	
	}}
};

var fileActionReject = function(){
	
	
	
	var flag = true;
	var array = [ "remarksReject"];
	
	if (common.isValid(array)) {
		flag = false;
	}
		
	
	if(flag==true){
	
	$('#showApproveModal').modal('hide');
	$('#showMarkDeficientModal').modal('hide');
	$('#showSendModal').modal('hide');
	$('#showRejectModal').modal('hide');
	$('#showinterOfficeTransferModal').modal('hide');
	
		
		
	
	
	
	
	var jsonreject={};
	var dataJsonactionReject = {};
	
	
	dataJsonactionReject.RCMCActionUpdateDTO={};

	dataJsonactionReject.RCMCActionUpdateDTO.remarks=$('#remarksReject').val();
	dataJsonactionReject.RCMCActionUpdateDTO.action=actionIn;
	dataJsonactionReject.RCMCActionUpdateDTO.fileNo=$('#fileNo').val();
	dataJsonactionReject.RCMCActionUpdateDTO.toUser=$('#applicantName').val();
	dataJsonactionReject.RCMCActionUpdateDTO = JSON.stringify(dataJsonactionReject.RCMCActionUpdateDTO);
	ajax.post("web?requestType=ApplicationRH&actionVal=approveReject&screenId=9000012381",dataJsonactionReject,	function(res) {

		
		console.log(res);
		
		if (res.fileIdSuccess =="Success" && res.fileNumberSuccess =="Success" ){
    	 bootbox.alert("The file has been rejected. ");
    	 reload();}
	else
		{
		 bootbox.alert("The file is failed to rejected. Please try again. ");
    	 reload();
		
		}
    	
	});
	}
	
};

var personIdSelect =function(elem)
{
	console.log(elem);
	var person=$(elem).find(':selected').data('person');
	
	console.log(person);

	$('#toPersonId').val(person);
	

}


var fileAction = function(){
	var flag = true;
	
	var array=[];
	var remarksDef=$('#markdeffRemarks').val();
	var remarksDefAmount="";
	var extraAmount=$("#amount").val();
	var payExtra=$(".DeficiencyAmount").prop("checked");
	if(payExtra==true){
	array = [ "markdeffRemarks","amount"];
	remarksDefAmount="Note: Exporter is requested to please use the respond with amendment option while responding to the deficiency."+remarksDef+"\n"+"Please pay mentioned extra amount :"+extraAmount;
	}
	else{
		array = [ "markdeffRemarks"];
		remarksDefAmount=remarksDef;
	}
	if (common.isValid(array)) {
		flag = false;
	}
		
	
	if(flag==true){

$('#showApproveModal').modal('hide');
$('#showMarkDeficientModal').modal('hide');
$('#showSendModal').modal('hide');
$('#showRejectModal').modal('hide');
$('#showinterOfficeTransferModal').modal('hide');
var json={};
var dataJsonaction = {};


dataJsonaction.RCMCActionUpdateDTO={};
//dataJsonaction.RCMCActionUpdateDTO = $('#showMarkDeficientModal').find("input,select,textarea")

dataJsonaction.RCMCActionUpdateDTO.remarks=remarksDefAmount;
dataJsonaction.RCMCActionUpdateDTO.action=actionIn;
dataJsonaction.RCMCActionUpdateDTO.fileNo=$('#fileNo').val();
dataJsonaction.RCMCActionUpdateDTO.toUser=$('#applicantName').val();

dataJsonaction.RCMCActionUpdateDTO.amount=extraAmount;
dataJsonaction.RCMCActionUpdateDTO = JSON.stringify(dataJsonaction.RCMCActionUpdateDTO);
console.log(dataJsonaction);
ajax.post("web?requestType=ApplicationRH&actionVal=approveReject&screenId=9000012381",dataJsonaction,	function(res) {

	
	console.log(res);
	
	if (res.fileIdSuccess =="Success" && res.fileNumberSuccess =="Success" ){
	 bootbox.alert("File has been marked deficient");
	 reload();
	}
		else
			{
			 bootbox.alert("File failed to mark deficient. Please try again.");
			 reload();
			
			}
});

	}
};

var fileActionSend = function(){
	var flag = true;

	var array = [ "sendRemarks","epcOfficer"];
	
	if (common.isValid(array)) {
		flag = false;
	}
if(flag==true)
	{
	
	

		var udateProfile = function () {
			if(flag==true){

				$('#showApproveModal').modal('hide');
				$('#showMarkDeficientModal').modal('hide');
				$('#showSendModal').modal('hide');
				$('#showRejectModal').modal('hide');
				$('#showinterOfficeTransferModal').modal('hide');



				var json={};
				var dataJsonaction = {};
				dataJsonaction.RCMCWorkListDTO={};
				var userDetailsKeyValue = $('#SendUserID').find("select")
				.serializeObject();

				dataJsonaction.RCMCWorkListDTO.remarks=$('#sendRemarks').val();
				dataJsonaction.RCMCWorkListDTO.action="2";
				dataJsonaction.RCMCWorkListDTO.toOffice=$('#CurrentOfficeIdSend').val();
				dataJsonaction.RCMCWorkListDTO.rcmcReqId=$('#rcmcReqId').val();
				dataJsonaction.RCMCWorkListDTO.currentUser=userDetailsKeyValue.epcOfficer.key;
				dataJsonaction.RCMCWorkListDTO.userDetails=userDetailsKeyValue.epcOfficer.value;
				dataJsonaction.RCMCWorkListDTO = JSON.stringify(dataJsonaction.RCMCWorkListDTO);
				ajax.post("web?requestType=ApplicationRH&actionVal=sendFile&screenId=9000012381",dataJsonaction,	function(res) {

					
					console.log(res);
					
					if (res.fileIdSuccess =="Success" && res.fileNumberSuccess =="Success" ){
					 bootbox.alert("File has been sent successfully ");
					 reload();
						}
					else
						{
						
						 bootbox.alert("File is failed to sent. Please try again.");
						 reload();
						}
					
					
				});
					}}
		
		var closeProfile = function () {
			$("showModal").prop("display","none");
		}

		
		
		modalDialog(" "," The file will be sent to the selected user. Do you wish to proceed?  ", udateProfile,closeProfile);
		
	}

	
	

};


var pullToMyWorklist = function(rcmcReqId,OfficeNameAt,fileNoSearch){
	

//$('#showApproveModal').modal('hide');


var json={};
var dataJsonaction = {};


dataJsonaction.RCMCWorkListDTO={};

dataJsonaction.RCMCWorkListDTO.action="1";
dataJsonaction.RCMCWorkListDTO.rcmcReqId=rcmcReqId;
dataJsonaction.RCMCWorkListDTO = JSON.stringify(dataJsonaction.RCMCWorkListDTO);
ajax.post("web?requestType=ApplicationRH&actionVal=pullToMyWorklist&screenId=9000012381",dataJsonaction,	function(res) {

	
	console.log(res);
	
		
	if (res.fileIdSuccess =="Success" && res.fileNumberSuccess =="Success" ){
	 bootbox.alert("File has been pulled to your worklist successfully ");
	 reloadWorklist(fileNoSearch);}
	else {
		
		 bootbox.alert("The file has not been pulled to your worklist. Please try again.");
		 reloadWorklist(fileNoSearch);
		
	}
	
});


};

$("#pageContent").off('click', '#btnSaveCertifciateAddDetails').on(
		'click', '#btnSaveCertifciateAddDetails', function() {

	var validUpto = $("#certValidUpto").val();
	var issueDate = $("#certIssueDate").val();
	var goodsDesc = $("#certGoodsDesc").val();
	var registerAs = $("#registeredAs").val();
	var additionalRemark = $("#certAdditionalRemark").val();
	var membCatgY= $('#membCatgY option:selected').text();
	
	var declaration=$('#declaration').val();
	var applicantName=$('#applicantName').val();
	var designation=$('#designation').val();
	var ipAddress=$('#ipAddress').val();
	var json = {};
/*	if($("#moduleJson").val() != "") {*/
/*		json.rcmcForm = JSON.parse($("#moduleJson").val());
	}
	
	if (json.rcmcForm != null && json.rcmcForm!=="" && json.rcmcForm.rcmcDetailsRCMCDTO!==null && json.rcmcForm.rcmcDetailsRCMCDTO.rcmcEpcMpgDTO!=null) {
		
		try {
			var numberOfYearSelectValidation = json.rcmcForm.rcmcDetailsRCMCDTO.rcmcEpcMpgDTO.numberOfYearSelect;
			debugger;

		} catch (e) {
			console.log(e);
		}
	}*/
	
	
	var selectedYearSeqCheck = $("#numberOfYearSelect").val();
	var selectedYearSeqCheckLength = $("#numberOfYearSelect").val().length;
	if(selectedYearSeqCheckLength > 1){
	for(var i=1;i<selectedYearSeqCheckLength;i++){
		var differenceCheck = parseInt($("#numberOfYearSelect").val()[i])- parseInt($("#numberOfYearSelect").val()[i-1]);
		if(differenceCheck != 1){
			
			$("#numberOfYearSelect").after('<div class="error-msg">Please Select Years in Sequence.</div>');
		return false;
			break;
		}
	}
	}
	var array = [ 'certValidUpto','certIssueDate'];
	debugger;
	var lenForSelctedYear = $('#numberOfYearSelect').val().length;
	var numberOfYearSelectValidation = {};
	var ArraySelectKey = $('#numberOfYearSelect').val();
	var ArraySelectValue = [];
	for(let i=0;i<lenForSelctedYear;i++){
		ArraySelectValue[i] = $('#numberOfYearSelect option:selected')[i].innerHTML;
	}
	for(let i=0;i<lenForSelctedYear;i++){
		numberOfYearSelectValidation[ArraySelectKey[i]] = ArraySelectValue[i];
	}
	
	var lenForBranchCombo = $('#additionalBranch').val().length;
	var BranchSelectValidation = {};
	var BranchSelectKey = $('#additionalBranch').val();
	var BranchSelectValue = [];
	for(let i=0;i<lenForBranchCombo;i++){
		BranchSelectValue[i] = $('#additionalBranch option:selected')[i].innerHTML;
	}
	for(let i=0;i<lenForBranchCombo;i++){
		BranchSelectValidation[BranchSelectKey[i]] = BranchSelectValue[i];
	}

	if (common.isValid(array)) {
		return false;
	}
	if(!$("#declaration").is(':checked'))
	{
		$('.declarationCheckId').after('<span class="error-msg">This is a mandatory field</span>');
		return false;
	}else{
		declaration=1;
	}
	var certJson = {'updateRCMCCertDtls' : {}};
	certJson.updateRCMCCertDtls.validUpto = validUpto;
	certJson.updateRCMCCertDtls.goodsDesc = goodsDesc;
	certJson.updateRCMCCertDtls.additionalRemark = additionalRemark;
	certJson.updateRCMCCertDtls.fileId = $("#fileID").val();
	certJson.updateRCMCCertDtls.issueDate = issueDate;
	certJson.updateRCMCCertDtls.registerAsKey=registerAs;
	certJson.updateRCMCCertDtls.membCatgY=membCatgY;
	certJson.updateRCMCCertDtls.declaration=declaration;
	certJson.updateRCMCCertDtls.applicantName=applicantName;
	certJson.updateRCMCCertDtls.designation=designation;
	certJson.updateRCMCCertDtls.ipAddress=ipAddress;
	certJson.updateRCMCCertDtls.numberOfYearSelectKey = ArraySelectKey;
	certJson.updateRCMCCertDtls.additionalBranchKey = BranchSelectKey;
	
	var pdtPnlGrpTable =[];
	pdtPnlGrpTable= getPdtPnlGrpDtls().data().toArray();
	common.buildKeyValuePair(pdtPnlGrpTable, "pdtCategory");
	common.buildKeyValuePair(pdtPnlGrpTable, "pdtSubCategory");
	certJson.updateRCMCCertDtls.rCMCPdtPnlGrpDTO = pdtPnlGrpTable;


	certJson.updateRCMCCertDtls = JSON.stringify(certJson.updateRCMCCertDtls);
	
	var url = "web?requestType=ApplicationRH&actionVal=updateCertificateDetails&screenId=9000012381";
	ajax.post(url , certJson,	function(res) {
		if (res.status =="Success") {
			bootbox.alert("Details has been saved successfully. ");
			$(".certPreviewValidUptoPopUp").html(validUpto);
			$(".certPreviewGoodsDescPopUp").html(goodsDesc);
			$(".certPreviewIssueDate").html(issueDate);
				$("#isCertFieldEditable").val(1);
		} else {
			bootbox.alert("Detials has been failed. Please try again.");
		}
	});	
});
var fileActionInterOfficeTransfer = function(){
	var flag = true;
	var array = [ "interOfficeTransferRemarks","epcOfficeSelect"];
	
	if (common.isValid(array)) {
		flag = false;
	}

	if(flag==true)
		{
		
		

			var udateProfile = function () {
				if(flag==true){

					$('#showApproveModal').modal('hide');
					$('#showMarkDeficientModal').modal('hide');
					$('#showSendModal').modal('hide');
					$('#showRejectModal').modal('hide');
					$('#showinterOfficeTransferModal').modal('hide');

						
						




					var json={};

					var dataJsonaction = {};

					var officeDetailsKeyValue = $('#sendToOffice').find("select")
					.serializeObject();

					dataJsonaction.RCMCWorkListDTO={};

					dataJsonaction.RCMCWorkListDTO.remarks=$('#interOfficeTransferRemarks').val();
					dataJsonaction.RCMCWorkListDTO.action="3";
					dataJsonaction.RCMCWorkListDTO.rcmcReqId=rcmcReqIdIn;
					dataJsonaction.RCMCWorkListDTO.toOffice=officeDetailsKeyValue.epcOfficeSelect.key;
					dataJsonaction.RCMCWorkListDTO = JSON.stringify(dataJsonaction.RCMCWorkListDTO);
					ajax.post("web?requestType=ApplicationRH&actionVal=interOfficeTransfer&screenId=9000012381",dataJsonaction,	function(res) {

						
						console.log(res);
						if (res.fileIdSuccess =="Success" && res.fileNumberSuccess =="Success" ){
						 bootbox.alert("The file has been transferred.");
						 reloadWorklist(fileNoSearchinterOffice);}
						else {
							
							 bootbox.alert("The file is failed to transfer. Please try again.");
							 reloadWorklist(fileNoSearchinterOffice);
							
						}
							
						
					});
						}
				}
			
			var closeProfile = function () {
				$("showModal").prop("display","none");
			}

			
			
			modalDialog(" "," The file will be sent to the selected office. Do you wish to proceed?   ", udateProfile,closeProfile);
			
		}

	
	

};



var getTotalFee=function()
{ 
	 var oTable = document.getElementById('feeTable');

	    //gets rows of table
	    var rowLength = oTable.rows.length;
		var fee=0.0;
	    //loops through rows    
	    for (i = 1; i < rowLength; i++){

	      //gets cells of current row  
	       var oCells = oTable.rows.item(i).cells;

	       //gets amount of cells of current row
	       var cellLength = oCells.length;

	       //loops through each cell in current row
	    
	              // get your cell info here

	       fee+=+(oCells.item(4).innerHTML);
	           //   alert(cellVal);
	           
	    }	
	    $("#totalFee").val(fee);
}



var fetchOfficesBasedOnEPC = function() {
	var json= {"nameOfCouncil" : {} };
	json.nameOfCouncil.key = $("#globalEPCId").val();
	
	json.form = JSON.stringify(json);
	var url=  "web?requestType=ApplicationRH&actionVal=GETEPCDETAILS&screenId=9000012371";
    ajax.post(url, json, function(data) {
	
	$('#officeName option').remove();
	$.each(data.epcAddress, function(i,item){
		var offName=item.competeAddress.split(",")[0];
			if(item.status.key == '8000002'){
				$('#epcOffice').append('<option data-epcaddress="'+item.competeAddress+'" value="'+item.epcOfcMpgId+'">'+offName+'</option>');
			}
		});
	});
    $("#epcOffice").trigger("chosen:updated");
}

var isEdits = false;
var editCerts = function(currElm, elem) {
	var td = $(currElm).parent().parent();
	$(td).find("span.pencil").addClass("d-none");
	$(td).find("span.save").removeClass("d-none");
	
	$("#"+elem).attr("disabled", false);
	
}
var isCertChange = function(){
	return isEdits;
}
var updateCertDtils = function(currElm, elem) {
	isEdits = true;
	var td = $(currElm).parent().parent();
	$(td).find("span.pencil").removeClass("d-none");
	$(td).find("span.save").addClass("d-none");
	
	$("#"+elem).attr("disabled", true);
	
}
var restoreVal = function(currElm, elem) {
	isEdits = true;
	var val = $(currElm).val();
	if(val == ""){
		$(currElm).val($("#"+elem).val());
	}
}
function validateMaxlengthWithCharTracker(id){
	$('#'+id).next(".error-msg").remove();
	$('#'+id).next(".warning-msg").remove();
	var maxlength =$('#'+id).attr("maxlength");
    var currentLength = $('#'+id).val().length;
    if( currentLength > (maxlength-1) ){
    	
    	$('#'+id).after('<span class="error-msg">You have reached the maximum number of characters.</span>');
    	
        }
    else {
    	$('#'+id).next(".error-msg").remove();
    	$('#'+id).next(".warning-msg").remove();
    	$('#'+id).after('<span class="warning-msg">Character remains are  :' +(maxlength-currentLength)+  '</span>');
    	
	}
    
	
}

var auth_dtl = null;

var loadAuthDetailsTbl = function() {
	
	$('.custom-datatable').css('width', '100%');
	auth_dtl = $('#authorityDetailsTable')
	.DataTable(
			{
				"scrollX" : "100%",
				bFilter : false,

				ordering : false,
				"order" : [],

				"columns" : [
					 {
						"data" : "auCategory_Value",
						className : "editable"
						
					},
					
						{
							"data" : "auName",
							className : "editable"
						},
						{
							"data" : "auDesignation",
							className : "editable"
						},
						{
							"data" : "auAddressLine1",
							className : "editable"
						},
						{
							"data" : "auAddressLine2",
							className : "editable"
						},
						{
							"data" : "auCity",
							className : "editable"
						},
						{
							"data" : "auPin",
							className : "editable"
						},
						{
							"data" : "auDistrict_Value",
							className : "editable"
						},
						
						{
							"data" : "auState_Value",
							className : "editable"
						},
						
						
						{
							"data" : "auTelephoneNo",
							className : "editable"
						},
						{
							"data" : "auMobileNo",
							className : "editable"
						},
						{
							"data" : "auEmail",
							className : "editable"
						}
						
						
				],
				"columnDefs" : [ {
					"defaultContent" : "-",
					"targets" : "_all"
				} ],
				"order" : [ [ 1, 'asc' ] ],

				select : {
					style : 'single'
				},

			});
	$($.fn.dataTable.tables(true)).DataTable()
    .columns.adjust();}


//viewFileHistory
var viewFileHist_dtl = null;

var loadViewTbl = function() {
	$('.custom-datatable').css('width', '100%');
	
	viewFileHist_dtl = $('#viewFileHistoryRCMC')
	.DataTable(
			{
				"scrollX" : "100%",
				bFilter : false,

				ordering : true,
				"order" : [],

				"columns" : [
					{
						"data" : "",
						className : "editable"
						
					},
					{
						"data" : "fileDate",
						className : "editable"
						
					},
					
						{
							"data" : "action",
							className : "editable"
						},
						{
							"data" : "userFrom",
							className : "editable"
						},
						{
							"data" : "userTo",
							className : "editable"
						},
						
						{
							"data" : "remarks",
							className : "editable"
						},
						
						
						{
							"data" : "attachments",
							className : "editable"
						}
						
						
				],
				"columnDefs" : [ {
					"defaultContent" : "-",
					"targets" : "_all"
				} ],
				"order" : [ [ 1, 'asc' ] ],

				select : {
					style : 'single'
				},

			});
	$('.custom-datatable').css('width', '100%');
	$($.fn.dataTable.tables(true)).DataTable()
    .columns.adjust();	
}

//eSign table

var eSign_dtl = null;

var eSignTbl = function() {
	
	//$('.custom-datatable').css('width', '100%');
	eSign_dtl = $('#esignTable')
	.DataTable(
			{
				"scrollX" : "100%",
				bFilter : false,

				ordering : false,
				"order" : [],

				"columns" : [
					{
						"data" : "esignType",
						className : "editable"
						
					},
					{
						"data" : "serialNumber",
						className : "editable"
						
					},
						{
							"data" : "crtDate",
							className : "editable"
						},
						{
							"data" : "certificateType",
							className : "editable"
						},
						{
							"data" : "certifyingAuthority",
							className : "editable"
						},
						{
							"data" : "commonName",
							className : "editable"
						},
						{
							"data" : "organisation",
							className : "editable"
						},
						{
							"data" : "certIssueDate",
							className : "editable"
						},
						{
							"data" : "certExpiryDate",
							className : "editable"
						}
						
						
				],
				"columnDefs" : [ {
					"defaultContent" : "-",
					"targets" : "_all"
				} ],
				"order" : [ [ 1, 'asc' ] ],

				select : {
					style : 'single'
				},

			});$('#esignTable').css('width', '100%');
			$($.fn.dataTable.tables(true)).DataTable()
		     .columns.adjust();}

var rcmc_oth_pmt_dtl = null;

var loadRcmcOthPmtTbl = function() {
	
	$('.custom-datatable').css('width', '100%');
	rcmc_oth_pmt_dtl = $('#rcmcOthPmtTable')
	.DataTable(
			{
				"scrollX" : false,
				bFilter : false,

				ordering : false,
				"order" : [],

				"columns" : [
						{
							"data" : "othPmtDate",
							className : "editable"
						},
						{
							"data" : "othPmtAmt",
							className : "editable"
						},
						{
							"data" : "othRefNum",
							className : "editable"
						},
						{
							"data" : "othBankName_key",
							className : "editable",
							visible : false
						},
						{
							"data" : "othBankName_Value",
							className : "editable"
						}
				],
				"columnDefs" : [ {
					"defaultContent" : "-",
					"targets" : "_all"
				} ],
				"order" : [ [ 1, 'asc' ] ],

				select : {
					style : 'single'
				},

			});
}

var surrAndRevokeModule = (function(){

	var loadFileData = function(fileNo) {
		var url = 'web?requestType=ApplicationRH&actionVal=fileDataRCMC&screenId=9000012381&fileNo=';
		url += fileNo;
			
		if($("#globalEPCId").length > 0) {
			url += "&epcId=" + $("#globalEPCId").val();
		}
		
		var serachParam = buildSearchParam();
		updateContainer(url,serachParam);	
	}
	
		
	return {
		loadFileData : loadFileData,
	}
})();


// pdt pnl sub category call start without

var pdtPnlSubData = function() {
	debugger;
	var pdtPnlEpcId = $('#nameOfCouncil').val();
	var pdtPnlId=	$('#pdtCategory').val();
	$('#pdtSubCategory').empty();

	var json = {};
	json.pdtPnlId = pdtPnlId;
	json.pdtPnlEpcId = pdtPnlEpcId;

	json.form = JSON.stringify(json);
	var url = "webHP?requestType=ApplicationRH&actionVal=getSubPdtPNlGrp&screenId=9000012371";
	ajax.post(url, json, function(data) {

		$('#pdtSubCategory').append(
				$('<option></option>').val('-1').html('Select'));
		if (data.length > 0) {
			$.each(data, function(i, item) {
				$('#pdtSubCategory').append(
						$('<option></option>').val(item.pdtPnlId).html( item.pdtSubCategory));
//				$('#pdtSubCategory').append(
//						'<option  value="' + item.pdtPnlId + '" >'
//								+ item.pdtSubCategory + '</option>');
			});
		}
		
//		$('#pdtSubCategory').append(
//				$('<option></option>').val("1").html( "teste1"));
//		$('#pdtSubCategory').append(
//				$('<option></option>').val("2").html( "test 2"));
		// else{bootbox.alert('You cannot proceed as the selected EPC / CB
		// has not on-boarded on the DGFT Common Platform. Please contact
		// the respective EPC / CB for further information.');}

	});

}

//pdt pnl sub category call end



     	
      // Product Panel group table
      	
      	



      	var pdtPnlGrp_dtl = null;

      	var loadPdtPnlGrpDetailsTbl = function() {
      		
      		$('.custom-datatable').css('width', '100%');
      		pdtPnlGrp_dtl  = $('#pdtPnlGrpTable')
      		.DataTable(
      				{
      					"scrollX" : true,
      					bFilter : false,

      					ordering : false,
      					"order" : [],

      					"columns" : [
      							{
      								"data" : "pdtCategory_key",
      								className : "editable",
      								visible : false
      							},
      							{
      								"data" : "pdtCategory_Value",
      								className : "editable"
      							},
      							{
      								"data" : "pdtSubCategory_key",
      								className : "editable",
      								visible : false
      							},
      							{
      								"data" : "pdtSubCategory_Value",
      								className : "editable"
      							},
      							{
      								data : null,
      								className : "center",
      								defaultContent : '<a href="javascript:void(0);" class="pdtEdit disabledbutton editor_edit editor_button fa-lg"><i class="fa fa-pencil "></i></a>/<a href="javascript:void(0);" class="pdtEdit disabledbutton editor_remove editor_button fa-lg"><i class="fa fa-trash "></i></a>  ',
      								"width": "20%"
      							
      							}
      					],
      					"columnDefs" : [ {
      						"defaultContent" : "-",
      						"targets" : "_all"
      					} ],
      					"order" : [ [ 1, 'asc' ] ],

      					select : {
      						style : 'single'
      					},

      				});

					  $(document).off('click', '#pdtPnlGrpTable tbody a.editor_remove').on(
						'click',
						'#pdtPnlGrpTable tbody a.editor_remove',
						function() {
							
							var row = $(this).closest('tr');
	
							common.deleteTableRow(pdtPnlGrp_dtl, row,
									function(data) {
	
										if (data == true) {
											$("#pdtCategory").val('-1').trigger("chosen:updated");
											  pdtPnlSubData();
											  $("#pdtSubCategory").val('-1').trigger("chosen:updated");
											  
											  $("#btnAddPdtPnlGrp").css("display", "block");
											  $("#btnUpdatePdtPnlGrp").css("display", "none");
										}
									});
	
						});
	
      	$(document).off('click',
      	'#pdtPnlGrpTable tbody a.editor_edit').on(
      	'click', '#pdtPnlGrpTable tbody a.editor_edit',
      	function() {

      			var rowitemDtlsTable = $(this).closest('tr');
      			setTableData(getPdtPnlGrpDtls(), rowitemDtlsTable);
      			var json = getPdtPnlGrpDtls().row(getSelectedRow()).data();
      			
      			common.buildKeyValueForJson(json, "pdtCategory");
      			common.buildKeyValueForJson(json, "pdtSubCategory");
      	
      			$("#pdtCategory").val(json.pdtCategory.key).trigger("chosen:updated");
      			pdtPnlSubData();
      			$("#pdtSubCategory").val(json.pdtSubCategory.key).trigger("chosen:updated");
      			
      			rowdata = rowitemDtlsTable;
      			
      			$("#btnAddPdtPnlGrp").css("display", "none");
      			$("#btnUpdatePdtPnlGrp").css("display", "block");
      		});
      	$($.fn.dataTable.tables(true)).css('width', '100%');
      	$($.fn.dataTable.tables(true)).DataTable().columns.adjust().draw();
      	}

      	
      	var getPdtPnlGrpDtls = function() {
      		
      		return pdtPnlGrp_dtl;
      	}
      	var siNoAuth = $('#pdtPnlGrpTable tr').length + 1;
      	var addDataInTablePdtPnlGrp = function() {
      		
      		
      		var flag = true;
      		var array = [ 
      		"pdtCategory","pdtSubCategory"];
      		
      		if (common.isValid(array)) {
      			flag = false;
      		}
      			if (flag) {
      			//alert(flag);
      			var json = $('#pdtPnlGrpInput').find("input,select,textarea")
      					.serializeObject();
      			json.pdtCategory_Value = $('#pdtCategory option:selected').text();
      			json.pdtCategory_key  = $('#pdtCategory').val();
      			json.pdtSubCategory_Value = $('#pdtSubCategory option:selected').text();
      			json.pdtSubCategory_key  = $('#pdtSubCategory').val();
      			pdtPnlGrp_dtl.row.add(json).draw();
      		
      			 $('.pdtEdit').removeClass('disabledbutton');
      		$("#pdtCategory").val(-1).trigger("chosen:updated");

      		$("#pdtSubCategory").val(-1).trigger("chosen:updated");
      }
      		return flag;
      			}

      	var updateDataInTablePdtPnlGrp = function() {
      		
      		
      		var flag = true;
      		var array = [ 
      			"pdtCategory","pdtSubCategory"];
      		
      		if (common.isValid(array)) {
      			flag = false;
      		}
      		
      		if (flag) {
      			
      			
      			var json = $('#pdtPnlGrpInput').find("input,select,textarea")
      			.serializeObject();
      		json.pdtCategory_Value = $('#pdtCategory option:selected').text();
      		json.pdtCategory_key  = $('#pdtCategory').val();
      		json.pdtSubCategory_Value = $('#pdtSubCategory option:selected').text();
      		json.pdtSubCategory_key  = $('#pdtSubCategory').val();
      	
      			if (getSelectedRow() != null) {
      				getPdtPnlGrpDtls().row(getSelectedRow()).data(json).draw();
      			}
      			
      			 $('.pdtEdit').removeClass('disabledbutton');
      			$("#pdtCategory").val(-1).trigger("chosen:updated");
  			    $("#pdtSubCategory").val(-1).trigger("chosen:updated");}

      		$("#btnAddPdtPnlGrp").css("display", "block");
      		$("#btnUpdatePdtPnlGrp").css("display", "none");
      	}

      	//panel pdt grp end




$(document).on('click', '.collapsed-icon', function() {

	$($.fn.dataTable.tables(true)).css('width', '100%');
	$($.fn.dataTable.tables(true)).DataTable().columns.adjust().draw();
});

loadPdtPnlGrpDetailsTbl();
var getSelectedRow = function(row) {
	return selectedRow;
}
var setTableData = function(tblId, row) {
	tableId = tblId;
	selectedRow = (row == undefined) ? null : row;
};
//var getTableData = function(tblId) {
//	return tableId;
//};
var tableId = null;
var selectedRow = null;
