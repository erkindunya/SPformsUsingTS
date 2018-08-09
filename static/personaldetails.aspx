<%@ Page language="C#" MasterPageFile="~masterurl/default.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c"  %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Import Namespace="Microsoft.SharePoint" %> <%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ContentPlaceholderID="PlaceHolderAdditionalPageHead" runat="server">
    <link href="./css/main.css" rel="stylesheet" />
</asp:content>
<asp:content ContentPlaceholderID="PlaceHolderMain" runat="server">

    <div id="personal-details-form" class="form-panel">

        <div class="text-center mb-5">
            <h1>Change of Personal Details Form</h1>
        </div>

        <div class="form-group col-xs-12 col-md-6">
          <label for="name">Name</label>
          <input type="text" class="form-control" id="name">
          <span class="text-danger error-message" data-validation-element="name">*required</span>
        </div>
        <div class="form-group col-xs-12 col-md-6">
          <label for="employee-number">Employee Number</label>
          <input type="text" class="form-control" id="employee-number">
          <span class="text-danger error-message" data-validation-element="employee-number">*required</span>
        </div>
        <div class="clearfix"></div>

        <fieldset>
          <legend class="col-xs-12">Change of address</legend>
          <div class="form-group col-xs-12">
            <label for="address">New Address</label>
            <textarea class="form-control" id="address"> </textarea>
          </div>
          <div class="form-group col-xs-12 col-md-4">
            <label for="postcode">New Postcode</label>
            <input type="text" class="form-control" id="postcode">
          </div>
          <div class="form-group col-xs-12 col-md-4">
            <label for="telephone-number">New Telephone Number</label>
            <input type="text" class="form-control" id="telephone-number">
          </div>
          <div class="form-group col-xs-12 col-md-4">
            <label for="personal-email">Personal Email</label>
            <input type="email" class="form-control" id="personal-email">
          </div>
          <div class="clearfix"></div>
          <div class="form-group col-xs-12">
            <label for="effective-date">Date Change Effective</label>
            <input type="datetime-local" value="2018-01-01T00:00:00.000" class="form-control" id="effective-date">
          </div>
        </fieldset>

        <fieldset>
          <legend class="col-xs-12">Emergency contact details</legend>
          <div class="form-group col-xs-12">
            <label for="emergency-name">Name</label>
            <input type="text" class="form-control" id="emergency-name">
          </div>
          <div class="form-group col-xs-12">
            <label for="emergency-address">Address</label>
            <textarea class="form-control" id="emergency-address"></textarea>
          </div>
          <div class="form-group col-xs-12">
            <label for="emergency-relationship">Relationship to you</label>
            <select class="form-control" id="emergency-relationship">
                <option>Child</option>
                <option>Friend</option>
                <option>Grandparent(s)</option>
                <option>Not Specified</option>
                <option>Other Relative</option>
                <option>Parent(s)</option>
                <option>Partner</option>
                <option>Sibling (brother / sister)</option>
                <option>Spouse</option>
            </select>
          </div>
          <div class="form-group col-xs-12 col-md-4">
            <label for="work-phone">Work Telephone Number</label>
            <input type="text" class="form-control" id="work-phone">
          </div>
          <div class="form-group col-xs-12 col-md-4">
            <label for="mobile-phone">Mobile Number</label>
            <input type="text" class="form-control" id="mobile-phone">
          </div>
          <div class="form-group col-xs-12 col-md-4">
            <label for="home-phone">Home Number</label>
            <input type="text" class="form-control" id="home-phone">
          </div>
          <div class="clearfix"></div>
        </fieldset>
        
        <fieldset>
            <legend class="col-xs-12">Change of Bank Account Details</legend>
            <div class="form-group col-xs-12 ">
              <label for="bank-name">Bank Name</label>
              <textarea class="form-control" id="bank-name"></textarea>
            </div>
            <div class="form-group col-xs-12 col-md-4">
              <label for="bank-account-number">Account number</label>
              <input type="text" class="form-control" id="bank-account-number">
            </div>
            <div class="form-group col-xs-12 col-md-4">
              <label for="bank-sort-code">Sort code</label>
              <input type="text" class="form-control" id="bank-sort-code">
            </div>
            <div class="form-group col-xs-12 col-md-4">
              <label for="bank-effective-date">Date Change Effective</label>
              <input type="datetime-local" value="2018-01-01T00:00:00.000" class="form-control" id="bank-effective-date">
            </div>
            <div class="clearfix"></div>
        </fieldset>
        
        <fieldset>
            <legend class="col-xs-12">Change of marital status</legend>
            <div class="form-group col-xs-12 col-md-6">
                <label for="marriage-title">New Title</label>
                <input type="text" class="form-control" id="marriage-title">
            </div>
            <div class="form-group col-xs-12 col-md-6">
                <label for="marriage-surname">New Surname</label>
                <input type="text" class="form-control" id="marriage-surname">
            </div>
        </fieldset>

        <fieldset class="form-group  col-xs-12">
                <legend>Please select your Line Manger</legend>
                <span class="form-text text-muted">This will be used for approval of this form. </span>
                <div id="LineManager"></div>
                <span class="text-danger error-message" data-validation-element="LineManager_TopSpan_HiddenInput" >*required</span>  
            </fieldset>

        <button type="button" id="submitPersonalDetails" class="btn btn-primary">Submit</button>
    </div>
    <div class="completed-panel row">
        <h2>Your form has been submitted.</h2>
        <p>The form will now be sent to your line manager for approval.</p>
    </div>


    <SharePoint:ScriptLink name="clienttemplates.js" runat="server" LoadAfterUI="true" Localizable="false" />
    <SharePoint:ScriptLink name="clientforms.js" runat="server" LoadAfterUI="true" Localizable="false" />
    <SharePoint:ScriptLink name="clientpeoplepicker.js" runat="server" LoadAfterUI="true" Localizable="false" />
    <SharePoint:ScriptLink name="autofill.js" runat="server" LoadAfterUI="true" Localizable="false" />
    <SharePoint:ScriptLink name="sp.js" runat="server" LoadAfterUI="true" Localizable="false" />
    <SharePoint:ScriptLink name="sp.runtime.js" runat="server" LoadAfterUI="true" Localizable="false" />
    <SharePoint:ScriptLink name="sp.core.js" runat="server" LoadAfterUI="true" Localizable="false" />


    <script src="/hr-forms/Documents/scripts/hrforms.js"></script>
    <script src="./js/libs.js"></script>
    <script src="./js/personaldetails.js"></script>
</asp:content>