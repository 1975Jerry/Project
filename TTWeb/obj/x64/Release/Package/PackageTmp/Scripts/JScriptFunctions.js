

function LoadMap() 
    {
    try {
        var element = document.getElementById('mapcontainer');
        if (element == null)
            {
                //debugger;
            }
            /*element.id = randomString(5);*/
            window.MyMap = new Microsoft.Maps.Map(document.getElementById(element.id), { credentials: 'An9eDuIsRVmZAKSD_iLrr4RMqqbK30ssMOwnBG_SEGBEp5MVLySR_diMHPsvAJ-h', center: new Microsoft.Maps.Location(38.333, 24.020202), mapTypeId: Microsoft.Maps.MapTypeId.road, zoom: 7 });
        }
    catch (err) 
    {
        alert('Map call failed');
    }
}

function randomString(length) 
{
    var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz'.split('');
    if (!length) {
        length = Math.floor(Math.random() * chars.length);
    }

    var str = '';
    for (var i = 0; i < length; i++) {
        str += chars[Math.floor(Math.random() * chars.length)];
    }
    return str;
}

function ClearMap() 
{
    if (typeof (window.MyMap) != 'undefined') 
    {
        if (window.MyMap != null) 
        {
            if (window.MyMap.getRootElement().parentNode != null) 
            {
                window.MyMap.dispose();
                window.MyMap = null;
            }
            else 
            {
                window.MyMap = null;
            }
        }
    }
    else 
    {
        window.MyMap = null;
    }
}

// this is for the multiselect combobox
// START MULTI SELECT COMBOBOX
var textSeparator = ";";
function OnListBoxSelectionChanged(dropdown, args, listBox) 
{
    if (args.index == 0)
        args.isSelected ? listBox.SelectAll() : listBox.UnselectAll();
    UpdateSelectAllItemState(listBox);
    UpdateText(dropdown, listBox);
}
function UpdateSelectAllItemState(listBox) 
{
    IsAllSelected(listBox) ? listBox.SelectIndices([0]) : listBox.UnselectIndices([0]);
}
function IsAllSelected(listBox) 
{
    var selectedDataItemCount = listBox.GetItemCount() - (listBox.GetItem(0).selected ? 0 : 1);
    return listBox.GetSelectedItems().length == selectedDataItemCount;
}
function UpdateText(dropdown, listBox) 
{
    var selectedItems = listBox.GetSelectedItems();
    dropdown.SetText(GetSelectedItemsText(selectedItems));
}
function SynchronizeListBoxValues(dropdown, listbox) 
{
    listbox.UnselectAll();
    var texts = dropdown.GetText().split(textSeparator);
    var values = GetValuesByTexts(texts, listbox);
    listbox.SelectValues(values);
    UpdateSelectAllItemState(listbox);
    UpdateText(dropdown, listbox); // for remove non-existing texts
}
function GetSelectedItemsText(items) 
{
    var texts = [];
    for (var i = 0; i<items.length; i++)
        if (items[i].index != 0)
            texts.push(items[i].text);
    return texts.join(textSeparator);
}
function GetValuesByTexts(texts, listbox) 
{
    var actualValues = [];
    var item;
    for (var i = 0; i < texts.length; i++) 
    {
        item = listbox.FindItemByText(texts[i]);
        if (item != null)
            actualValues.push(item.value);
    }
    return actualValues;
}
// END MULTI SELECT COMBOBOX

function OnGetRowValues(values) 
{
    if (typeof (descriptionmemo) != 'undefined') 
    {
        descriptionmemo.SetText(values[0]);
    }

    if (typeof (personnel) != 'undefined') {
        personnel.SetText(values[3]);
    }

    var text = pagecontrol.GetActiveTab().GetText();

    if (text == 'Spare Parts') 
    {
        if (typeof (sparepartsGrid) != 'undefined') 
        {
            sparepartsGrid.PerformCallback(values);
        }
    }
}

function OnGridInterventionsFocusChanged() 
{
    if ((typeof (gridviewInterventions) != 'undefined') && (gridviewInterventions.GetFocusedRowIndex() != -1)) 
    {
        gridviewInterventions.GetRowValues(gridviewInterventions.GetFocusedRowIndex(), 'Hidden_description;Hidden_int_id;Hidden_team_id;Hidden_personnel', OnGetRowValues);
    }

    else if ((typeof (gridviewInterventions) != 'undefined') && (gridviewInterventions.GetFocusedRowIndex() == -1)) 
    {
        gridviewInterventions.SetFocusedRowIndex(0);
    }
}

function OnGridProblemsFocusChanged() 
{
    if ((typeof (gridViewProblems) != 'undefined') && (gridViewProblems.GetFocusedRowIndex() != -1)) {
        gridViewProblems.GetRowValues(gridViewProblems.GetFocusedRowIndex(), 'Ceased_time', OnGetProblemRowValues);
    }
}

function UpdatePendings() 
{
    gridviewInterventions.GetRowValues(gridviewInterventions.GetFocusedRowIndex(), 'Hidden_description;Hidden_int_id;Hidden_team_id', OnUpdatePendings);
}

function OnUpdatePendings(values) 
{
    pendingsGrid.PerformCallback(values);
}

function UpdateSpareParts() 
{
    gridviewInterventions.GetRowValues(gridviewInterventions.GetFocusedRowIndex(), 'Hidden_description;Hidden_int_id;Hidden_team_id', OnUpdateSpareParts);
}

function OnUpdateSpareParts(values) 
{
    sparepartsGrid.PerformCallback(values);
}

function UpdateParticipants() 
{
    gridviewInterventions.GetRowValues(gridviewInterventions.GetFocusedRowIndex(), 'Hidden_description;Hidden_int_id;Hidden_team_id', OnUpdateParticipants);
}

function OnUpdateParticipants(values) 
{
    participantsGrid.PerformCallback(values);
}


function OnGetProblemRowValues(values) 
{
    /*if ((values != null) && (typeof (updateProblem) != 'undefined')) {
        if (updateProblem.GetEnabled() == true) {
            updateProblem.SetEnabled(false);
        }
        return;
    }
    if ((values == null) && (typeof (updateProblem) != 'undefined') && (gridViewProblems.cpRowCount > 0)) {
        if (updateProblem.GetEnabled() == false) {
            updateProblem.SetEnabled(true);
        }
    }*/
    if ((typeof (updateProblem) != 'undefined') && (gridViewProblems.cpRowCount > 0)) 
    {
        if (updateProblem.GetEnabled() == false) 
        {
            updateProblem.SetEnabled(true);
        }
    }
}
/*
var arraydatetime = [];
var arraydeparturetime = [];
var radiobuttons = [];
var intercategory = [];
var inttype = [];
var sitetypes = [];
var distances = [];
var radiobuttonssolved = [];
var listboxes = [];
var listboxestype = [];
var sitecommentsarray = [];

function ClearArrays() {
    distances.length = 0;
    arraydatetime.length = 0;
    arraydeparturetime.length = 0;
    radiobuttons.length = 0;
    intercategory.length = 0;
    inttype.length = 0;
    sitetypes.length = 0;
    radiobuttonssolved.length = 0;
    listboxes.length = 0;
    listboxestype.length = 0;
    sitecommentsarray.length = 0;
}*/

function CalculateKms() {
    var total = 0;
    for (i = 0; i < distances.length; i++) {
        total = total + distances[i].GetValue();
    }
    total = Math.round(total + returntohome.GetValue());
    return total;
}

function CalculateCost() {
    return Math.round((spingas.GetValue() + spintoll.GetValue() + consumablecost.GetValue() + spinmeals.GetValue() + spinovernight.GetValue() + spintaxi.GetValue() + spinparking.GetValue() + spinothercarexpenses.GetValue() + spinferrytickets.GetValue() + spinferrycarlimitviolation.GetValue() + spinairlinetickets.GetValue() + spinairlineoverweight.GetValue() + spinothertickets.GetValue() + spinofficeexpenses.GetValue()) * 100) / 100;
}

function CalculateCredit() {
    return Math.round((spingas_credit.GetValue() + spintoll_credit.GetValue() + consumablecost_credit.GetValue() + spinovernight_credit.GetValue() + spintaxi_credit.GetValue() + spinparking_credit.GetValue() + spinothercarexpenses_credit.GetValue() + spinferrytickets_credit.GetValue() + spinferrycarlimitviolation_credit.GetValue() + spinairlinetickets_credit.GetValue() + spinairlineoverweight_credit.GetValue() + spinothertickets_credit.GetValue() + spinofficeexpenses_credit.GetValue()) * 100) / 100;
}


function CalculateCash() {
    return Math.round((spingas.GetValue() + spintoll.GetValue() + consumablecost.GetValue() + spinmeals.GetValue() + spinovernight.GetValue()) * 100) / 100;
}


function GetControlIndex(s) {

    for (i = 0; i < radiobuttons.length; i++) {
        if (radiobuttons[i] == s) {
            return i;
        }
    }
}

function ValidateSchEditControl() {
    var valid = true;
    if (engineer1.GetEnabled() == true && engineer1.GetSelectedIndex() == -1) 
    {
        engineer1.SetIsValid(false);
        valid = false;
    }
    if (vehicle.GetEnabled() == true && vehicle.GetSelectedIndex() == -1) {
        vehicle.SetIsValid(false);
        valid = false;
    }

    /*if (returntohome.GetEnabled() == true && returntohome.GetValue() == 0) {
        returntohome.SetIsValid(false);
        valid = false;
    }*/

    if (returntime.GetEnabled() == true && returntime.GetValue() == null) {
        returntime.SetIsValid(false);
        valid = false;
    }

    if (departuretime.GetEnabled() == true && departuretime.GetValue() == null) {
        departuretime.SetIsValid(false);
        valid = false;
    }

    /*
    for (var k = 0; k < sitecommentsarray.length; k++) {
        var text = sitecommentsarray[k].GetText();
        text = text.replace(' ', '');
        if (text == '') {
            sitecommentsarray[k].SetIsValid(false);
            valid = false;
        }
    }
    
    for (var n=0; n<radiobuttons.length;n++) {

        if (radiobuttons[n].GetSelectedIndex() == -1) {
            radiobuttons[n].SetIsValid(false);
            valid = false;
        }
        else {
            if (radiobuttons[n].GetSelectedIndex() == 0) {
                if (sitetypes[n].GetSelectedIndex() == -1) {
                    sitetypes[n].SetIsValid(false);
                    valid = false;
                }
                if (arraydatetime[n].GetValue() == null) {
                    arraydatetime[n].SetIsValid(false);
                    valid = false;
                }
                if (arraydeparturetime[n].GetValue() == null) {
                    arraydeparturetime[n].SetIsValid(false);
                    valid = false;
                }

                if (arraydatetime[n].GetValue() != null && arraydeparturetime[n].GetValue() != null) {
                    if (arraydeparturetime[n].GetValue() < arraydatetime[n].GetValue()) {
                        arraydeparturetime[n].SetIsValid(false);
                        valid = false;
                    }
                }
                /*
                if (intercategory[n].GetSelectedIndex() == -1) {
                    intercategory[n].SetIsValid(false);
                    valid = false;
                }

                if (inttype[n].GetSelectedIndex() == -1) {
                    inttype[n].SetIsValid(false);
                    valid = false;
                }*/

                /*
                if (intercategory[n].GetText() == '') {
                    intercategory[n].SetIsValid(false);
                    valid = false;
                }

                if (inttype[n].GetText() == '') {
                    inttype[n].SetIsValid(false);
                    valid = false;
                }

                if (radiobuttonssolved[n].GetSelectedIndex() == -1) {
                    radiobuttonssolved[n].SetIsValid(false);
                    valid = false;
                }
            }
        }
    }
    */
    if (valid==false) {
        alert('Validation failed!');
        return false;
    }
    return true;
}