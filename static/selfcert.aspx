<%@ Page language="C#" MasterPageFile="~masterurl/default.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c"  %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Import Namespace="Microsoft.SharePoint" %> <%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:Content ContentPlaceholderID="PlaceHolderAdditionalPageHead" runat="server">
  <link href="./css/main.css" rel="stylesheet" />
</asp:content>
<asp:content ContentPlaceholderID="PlaceHolderMain" runat="server">

  <div class="container">
    <div class="form-panel row">
        <div class="col-sm border rounded bg-light p-5 m-5">
            <div class="text-center mb-5">
                <h1 class="form-title">Self-certification of sickness absence record</h1>
                <p>To be completed by the employee for all absences from work due to sickness. If sickness continues for
                    more than seven calendar days, this form must be accompanied by a Statement of Fitness for Work from
                    your doctor.</p>
            </div>
            <div class="spacer"></div>

            <fieldset>
                <div class="col-xs-12" >
                    <legend class="question-header">Employee details</legend>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="Name">Name</label>
                        <input class="form-control" type="text" id="Name" name="Name" value="">
                        <span class="text-danger error-message" data-validation-element="Name" >*required</span>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="EmployeeNumber">Employee No.</label>
                        <input class="form-control" type="text" id="EmployeeNumber" name="EmployeeNumber" value="">
                        <span class="text-danger error-message" data-validation-element="EmployeeNumber" >*required</span>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="EmployingCompany">Employing company</label>
                        <input class="form-control" type="text"  id="EmployingCompany" name="EmployingCompany" value="">
                        <span class="text-danger error-message" data-validation-element="EmployingCompany" >*required</span>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="Department">Site/department</label>
                        <input class="form-control" type="text" id="Department" name="Department" value="">
                        <span class="text-danger error-message" data-validation-element="Department" >*required</span>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6 col-lg-3">
                        <label for="StartDate">First day of absence</label>
                        <input class="form-control" type="datetime-local" id="StartDate" name="StartDate" value="2018-01-01T00:00:00.000">
                        <span class="text-danger error-message" data-validation-element="StartDate" >*required</span>
                    </div>
                    <div class="form-group  col-md-6 col-lg-3">
                        <label for="EndDate">Returned to work</label>
                        <input class="form-control" type="datetime-local" id="EndDate" name="EndDate" value="2018-01-01T00:00:00.000">
                        <span class="text-danger error-message" data-validation-element="EndDate" >*required</span>
                    </div>
                    <div class="form-group col-lg-6">
                        <label for="AbsenceLength">Length of absence (working days only)</label>
                        <input class="form-control" type="number" id="AbsenceLength" name="AbsenceLength" value="0">
                        <span class="text-danger error-message" data-validation-element="AbsenceLength" >*required</span>
                    </div>
                </div>
            </fieldset>
            <div class="form-group col-xs-12">
                <label for="AbsenceReason">Reason for absence</label>
                <select class="form-control" data-val="true" data-val-required="The Reason for absence field is required." id="AbsenceReason" name="AbsenceReason">
                    <option>Infectious disease</option>
                    <option>Respiratory tract disorders</option>
                    <option>Abdominal problems</option>
                    <option>Back and musculoskeletal problems</option>
                    <option>Headache/migraine</option>
                    <option>Mental health</option>
                    <option>Pregnancy related</option>
                    <option>Throat, ear and eye</option>
                    <option>Dental treatment</option>
                    <option>Allergic reactions</option>
                    <option>Chronic fatigue/ME</option>
                    <option>Skin conditions</option>
                    <option>Gynaecological/breast problems</option>
                    <option>Heart and circulatory problems, blood problems</option>
                    <option>Accidents at work</option>
                    <option>Road traffic accidents</option>
                    <option>Other accidents</option>
                    <option>Neurological and endocrine disorders</option>
                    <option>Cancer</option>
                    <option>Urinary tract problems</option>
                    <option>Medical appointment</option>
                </select>
                <span class="text-danger field-validation-valid" data-valmsg-for="AbsenceReason" data-valmsg-replace="true"></span>
            </div>
            
            <div class="spacer"></div>

            <fieldset class="form-group col-xs-12">
                <legend class="question-header">Was the absence caused by an injury at work?</legend>
                <div class="form-check form-check-inline">
                    <input id="CausedByWorkYes" class="form-check-input" type="radio" value="true" data-val="true" data-val-required="The Was the absence caused by an injury at work? field is required." name="CausedByWork">
                    <label class="form-check-label" for="CausedByWorkYes">
                        Yes
                    </label>
                </div>

                <div class="form-check form-check-inline">
                    <input id="CausedByWorkNo" class="form-check-input" type="radio" value="false" checked="checked" name="CausedByWork">
                    <label class="form-check-label" for="CausedByWorkNo">
                        No
                    </label>
                </div>

                <span class="text-danger field-validation-valid" data-valmsg-for="CausedByWork" data-valmsg-replace="true"></span>
                <p>Employees should note that if absence is due to an injury received at their place of work, it is
                    their responsibility to ensure that an accurate entry has been made in the Accident Book (BI
                    510) kept at their place of work.</p>
            </fieldset>
            
            <div class="spacer"></div>
            
                <fieldset class="form-group col-lg-4">
                    <legend class="question-header">Did you attend hospital?</legend>
                    <div class="form-check form-check-inline">
                        <input id="AttendedHospitalYes" class="form-check-input" type="radio" value="true" data-val="true" data-val-required="The Did you attend hospital? field is required." name="AttendedHospital">
                        <label class="form-check-label" for="AttendedHospitalYes">
                            Yes
                        </label>
                    </div>

                    <div class="form-check form-check-inline">
                        <input id="AttendedHospitalNo" class="form-check-input" type="radio" value="false" checked="checked" name="AttendedHospital">
                        <label class="form-check-label" for="AttendedHospitalNo">
                            No
                        </label>
                    </div>
                    <span class="text-danger field-validation-valid" data-valmsg-for="AttendedHospital" data-valmsg-replace="true"></span>
                </fieldset>
                <fieldset class="form-group col-lg-4">
                    <legend class="question-header">Did you attend a clinic?</legend>
                    <div class="form-check form-check-inline">
                        <input id="AttendedClinicYes" class="form-check-input" type="radio" value="true" data-val="true" data-val-required="The Did you attend a clinic? field is required." name="AttendedClinic">
                        <label class="form-check-label" for="AttendedClinicYes">
                            Yes
                        </label>
                    </div>

                    <div class="form-check form-check-inline">
                        <input id="AttendedClinicNo" class="form-check-input" type="radio" value="false" checked="checked" name="AttendedClinic">
                        <label class="form-check-label" for="AttendedClinicNo">
                            No
                        </label>
                    </div>
                    <span class="text-danger field-validation-valid" data-valmsg-for="AttendedClinic" data-valmsg-replace="true"></span>
                </fieldset>
                <fieldset class="form-group col-lg-4">
                    <legend class="question-header">Did you attend a doctor?</legend>
                    <div class="form-check form-check-inline">
                        <input id="AttendedDoctorYes" class="form-check-input" type="radio" value="true" data-val="true" data-val-required="The Did you attend a doctor? field is required." name="AttendedDoctor">
                        <label class="form-check-label" for="AttendedDoctorYes">
                            Yes
                        </label>
                    </div>

                    <div class="form-check form-check-inline">
                        <input id="AttendedDoctorNo" class="form-check-input" type="radio" value="false" checked="checked" name="AttendedDoctor">
                        <label class="form-check-label" for="AttendedDoctorNo">
                            No
                        </label>
                    </div>
                    <span class="text-danger field-validation-valid" data-valmsg-for="AttendedDoctor" data-valmsg-replace="true"></span>
                </fieldset>
                <div class="clearfix"></div>
            <div class="form-group col-xs-12">
                <label for="DetailsAttended">Please give name and address of those attended?</label>
                <textarea class="form-control" id="DetailsAttended" name="DetailsAttended"></textarea>
                <span class="text-danger field-validation-valid" data-valmsg-for="DetailsAttended" data-valmsg-replace="true"></span>
            </div>
            
            <div class="spacer"></div>

            <fieldset class="form-group  col-xs-12">
                <legend class="question-header">Are you currently taking any medication?</legend>
                <div class="form-check form-check-inline">
                    <input id="TakingMedicationYes" class="form-check-input" type="radio" value="true" data-val="true" data-val-required="The Are you currently taking any medication? field is required." name="TakingMedication">
                    <label class="form-check-label" for="TakingMedicationYes">
                        Yes
                    </label>
                </div>

                <div class="form-check form-check-inline">
                    <input id="TakingMedicationNo" class="form-check-input" type="radio" value="false" checked="checked" name="TakingMedication">
                    <label class="form-check-label" for="TakingMedicationNo">
                        No
                    </label>
                </div>
                <span class="text-danger field-validation-valid" data-valmsg-for="TakingMedication" data-valmsg-replace="true"></span>
            </fieldset>
            
            <div class="spacer"></div>
            
            <fieldset class="form-group  col-xs-12">
                <legend class="question-header">Please select your Line Manger</legend>
                <label>This will be used for approval of this form. </label>
                <div id="LineManager"></div>
                <span class="text-danger error-message" data-validation-element="LineManager_TopSpan_HiddenInput" >*required</span>  
            </fieldset>
            <div class="col-xs-12">
                <div class="my-3">
                    <div class="g-recaptcha" data-sitekey="6LehMGUUAAAAAAJeTwL9sla4eXlXifDh532qeodm" data-callback="recaptchaValidated"></div>
                </div>
                <p>By submitting this form I acknowledge that I understand that if I provide inaccurate or false information
                    about my absence, it may be treated as gross misconduct and could result in my summary dismissal
                    from the company.</p>
                <button type="button" id="submitSelfCert" class="btn btn-primary">Submit</button>
                <input name="__RequestVerificationToken" type="hidden" value="CfDJ8GWwDReqfRdMuhGRBIqjlA-nSntZUWQCDIIfJrXyyV8NeZWkFpQjNDriVtlQB7Tgslx83q_wLa993W_LqkGvGYG2SEaS_kJMZpcPJIJqdW0PVGbTQ1azRuqkHLYU82d8XkLHPsxt5OnxEr_1XrxBR4o">
            </div>
        </div>
    </div>

    <div class="completed-panel row">
        <h2>Your form has been submitted.</h2>
        <p>The form will now be sent to your line manager for approval.</p>
    </div>

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
<script src="./js/selfcert.js"></script>
</asp:content>