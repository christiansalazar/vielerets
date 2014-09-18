<?php
$map = array(
"0"=>array("id","Matrix_Unique_ID"),
"1"=>array("address","Address"),
"2"=>array("intfeatures","InteriorFeatures"),
"3"=>array("sold_date","CloseDate"), 
"4"=>array("sysid","Matrix_Unique_ID"),
"5"=>array("zipcode","PostalCode"),
"6"=>array("extfeatures","ExteriorFeatures"),
"7"=>array("sold_price","ClosePrice"),
"8"=>array("mlsnumb","MLSNumber"),
"9"=>array("beds","BedsTotal"),
"10"=>array("pool","Pool"),
"11"=>array("sold_office_id","SellingOfficeMLSID"),
"12"=>array("type","PropertyType"),
"13"=>array("baths","BathsTotal"),
"14"=>array("newconstruction","NewConstructionYN"),
"15"=>array("selling_agent_id","SellingAgentMLSID"),
"16"=>array("statecode","StateOrProvince"),
"17"=>array("price","ListPrice"),
"18"=>array("driving","DrivingDirections"),
"19"=>array("selling_office_name","SellingOfficeName"),
"20"=>array("statename","StateOrProvince"),
"21"=>array("remarks","PublicRemarksNew"),
"22"=>array("listing_date","OriginalEntryTimestamp"),
"23"=>array("selling_agent_name","SellingAgentFullName"),
"24"=>array("countyname","CountyOrParish"),
"25"=>array("yearbuilt","YearBuilt"),
"26"=>array("status_change_date","StatusChangeTimestamp"),
"27"=>array("single_agent_comp","SingleAgentComp"),
"28"=>array("cityname","StreetCity"),
"29"=>array("lotsize","LotSizeSqFt"),
"30"=>array("status","Status"),
"31"=>array("trans_broker_comp","TransBrokerComp"),
"32"=>array("streetnumber","StreetNumber"),
"33"=>array("pets","PetsAllowedYN"),
"34"=>array("agent_id","ListAgentMLSID"),
"35"=>array("record_status",""),
"36"=>array("streetname","StreetName"),
"37"=>array("appliances","AppliancesIncluded"),
"38"=>array("sold_agent_id","SellingAgentMLSID"),
"39"=>array("list_agent_email","ListAgentEmail"),
"40"=>array("list_agent_full_name","ListAgentFullName"),
"41"=>array("list_agent_mlsid","ListAgentMLSID"),
"42"=>array("list_agent_mui","ListAgent_MUI"),
"43"=>array("list_office_head_office_mui","ListOfficeHeadOffice_MUI"),
"44"=>array("list_office_mlsid","ListOfficeMLSID"),
"45"=>array("list_office_name","ListOfficeName"),
"46"=>array("list_office_phone","ListOfficePhone"),
"47"=>array("list_office_mui","ListOffice_MUI"),
"48"=>array("listing_contract_date","ListingContractDate"),
"49"=>array("listing_type","ListingType"),
"50"=>array("legal_description","LegalDescription"),
"51"=>array("legal_subdivision_name","LegalSubdivisionName"),
"52"=>array("hoa_fee","HOAFee"),
"53"=>array("hoa_payment_schedule","HOAPaymentSchedule"),
"54"=>array("realtor_only_remarks","RealtorOnlyRemarks"),
);

$_themap = "\$MAP=array(\"TARGET\"=>array(";
foreach($map as $index=>$data){
	list($db_fieldname, $mls_fieldname) = $data;
	$item = sprintf("\"%s\"=>\"%s\",", $index, $db_fieldname);
	$_themap .= $item;
}
$_themap .= "),\"SOURCE\"=>array(";
foreach($map as $index=>$data){
	list($db_fieldname, $mls_fieldname) = $data;
	if(""==$mls_fieldname) $mls_fieldname = "--NOT_USED--";
	$item = sprintf("\"%s\"=>\"%s\",", $index, $mls_fieldname);
	$_themap .= $item;
}
$_themap .= "));";
echo str_replace("%MAP%",$_themap,file_get_contents("./extract.template"));

