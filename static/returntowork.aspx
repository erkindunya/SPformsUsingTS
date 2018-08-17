<%@ Page language="C#" MasterPageFile="~masterurl/default.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c"  %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Import Namespace="Microsoft.SharePoint" %> <%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ContentPlaceholderID="PlaceHolderAdditionalPageHead" runat="server">
    <link href="./css/main.css" rel="stylesheet" />
</asp:content>

<asp:content ContentPlaceholderID="PlaceHolderMain" runat="server">

    <div id="return-to-work-form" class="form-panel">
        <div class="col-sm border rounded bg-light p-5 m-5">
            <div class="text-center mb-5">
                <h1 class="form-title">Return to Work Form</h1>
                <p>To be completed by the line manager with the employee, either face to face or over the telephone.</p>
            </div>

            <div class="spacer"></div>

            <fieldset>
                <div class="col-xs-12">
                    <legend class="question-header">Employee details</legend>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="Name">Name</label>
                        <input class="form-control" type="text" id="Name" name="Name" value="">
                        <span class="text-danger error-message" data-validation-element="Name">*required</span>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="EmployeeNumber">Employee No.</label>
                        <input class="form-control" type="text" id="EmployeeNumber" name="EmployeeNumber" value="">
                        <span class="text-danger error-message" data-validation-element="EmployeeNumber">*required</span>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="EmployingCompany">Employing company</label>
                        <input class="form-control" type="text" id="EmployingCompany" name="EmployingCompany" value="">
                        <span class="text-danger error-message" data-validation-element="EmployingCompany">*required</span>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="Department">Site/department</label>
                        <input class="form-control" type="text" id="Department" name="Department" value="">
                        <span class="text-danger error-message" data-validation-element="Department">*required</span>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6 col-lg-3">
                        <label for="StartDate">First day of absence</label>
                        <input class="form-control" type="datetime-local" id="StartDate" name="StartDate" value="2018-01-01T00:00:00.000">
                        <span class="text-danger error-message" data-validation-element="StartDate">*required</span>
                    </div>
                    <div class="form-group  col-md-6 col-lg-3">
                        <label for="EndDate">Returned to work</label>
                        <input class="form-control" type="datetime-local" id="EndDate" name="EndDate" value="2018-01-01T00:00:00.000">
                        <span class="text-danger error-message" data-validation-element="EndDate">*required</span>
                    </div>
                    <div class="form-group col-lg-6">
                        <label for="AbsenceLength">Length of absence (working days only)</label>
                        <input class="form-control" type="number" id="AbsenceLength" name="AbsenceLength" value="0">
                        <span class="text-danger error-message" data-validation-element="AbsenceLength">*required</span>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="form-group col-xs-12">
                    <label for="AbsenceReason">Reason for absence</label>
                    <select class="form-control" data-val="true" data-val-required="The Reason for absence field is required." id="AbsenceReason"
                        name="AbsenceReason">
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
            </fieldset>

            <div class="spacer"></div>

            <fieldset class="form-group col-xs-12">
                <legend class="question-header">Did the employee properly notify the employer of his/her absence in accordance with the managing sickness
                    absence reporting procedure?</legend>
                <div class="form-check form-check-inline">
                    <input id="EmployeeNotifiedYes" class="form-check-input" type="radio" value="true" data-val="true" data-val-required="The Was the absence caused by an injury at work? field is required."
                        name="EmployeeNotified">
                    <label class="form-check-label" for="EmployeeNotifiedYes">
                        Yes
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input id="EmployeeNotifiedNo" class="form-check-input" type="radio" value="false" checked="checked" name="EmployeeNotified">
                    <label class="form-check-label" for="EmployeeNotifiedNo">
                        No
                    </label>
                </div>
            </fieldset>

            <div class="spacer"></div>

            <fieldset class="form-group col-xs-12">
                <legend class="question-header">If the employee consulted his/her GP, are there any recommendations on a fit note as to a phased return
                    to work or potential changes to the employee’s hours, duties or to the working environment?</legend>
                <div class="form-check form-check-inline">
                    <input id="GPRecommendationYes" class="form-check-input" type="radio" value="true" data-val="true" data-val-required="The Was the absence caused by an injury at work? field is required."
                        name="GPRecommendation">
                    <label class="form-check-label" for="GPRecommendationYes">
                        Yes
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input id="GPRecommendationNo" class="form-check-input" type="radio" value="false" checked="checked" name="GPRecommendation">
                    <label class="form-check-label" for="GPRecommendationNo">
                        No
                    </label>
                </div>
            </fieldset>

            <fieldset class="form-group col-xs-12">
                <label for="GPRecommendationDetails">If yes, please state what these recommendations are and whether they are thought to be practicable:</label>
                <textarea class="form-control" id="GPRecommendationDetails" name="GPRecommendationDetails"></textarea>
                <span class="text-danger field-validation-valid" data-valmsg-for="GPRecommendationDetails" data-valmsg-replace="true"></span>
            </fieldset>

            <div class="spacer"></div>

            <fieldset class="form-group col-xs-12">
                <legend class="question-header">Are there any further absences/appointments anticipated?</legend>
                <div class="form-check form-check-inline">
                    <input id="FurtherAbsencesYes" class="form-check-input" type="radio" value="true" data-val="true" data-val-required="The Was the absence caused by an injury at work? field is required."
                        name="FurtherAbsences">
                    <label class="form-check-label" for="FurtherAbsencesYes">
                        Yes
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input id="FurtherAbsencesNo" class="form-check-input" type="radio" value="false" checked="checked" name="FurtherAbsences">
                    <label class="form-check-label" for="FurtherAbsencesNo">
                        No
                    </label>
                </div>
            </fieldset>

            <fieldset class="form-group col-xs-12">
                <label for="MeasuresDetails">If yes, give details:</label>
                <textarea class="form-control" id="FurtherAbsencesDetails" name="FurtherAbsencesDetails"></textarea>
                <span class="text-danger field-validation-valid" data-valmsg-for="FurtherAbsencesDetails" data-valmsg-replace="true"></span>
            </fieldset>

            <div class="spacer"></div>

            <fieldset class="form-group col-xs-12">
                <legend class="question-header">Has the employee identified any measures to help him/her?</legend>
                <div class="form-check form-check-inline">
                    <input id="MeasuresYes" class="form-check-input" type="radio" value="true" data-val="true" data-val-required="The Was the absence caused by an injury at work? field is required."
                        name="Measures">
                    <label class="form-check-label" for="MeasuresYes">
                        Yes
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input id="MeasuresNo" class="form-check-input" type="radio" value="false" checked="checked" name="Measures">
                    <label class="form-check-label" for="MeasuresNo">
                        No
                    </label>
                </div>
            </fieldset>

            <fieldset class="form-group col-xs-12">
                <label for="MeasuresDetails">If yes, give details:</label>
                <textarea class="form-control" id="MeasuresDetails" name="MeasuresDetails"></textarea>
                <span class="text-danger field-validation-valid" data-valmsg-for="MeasuresDetails" data-valmsg-replace="true"></span>
            </fieldset>

            <div class="spacer"></div>

            <fieldset class="form-group col-xs-12">
                <legend class="question-header">Has the employee identified anything within his/her work environment that contributed to the absence?</legend>
                <div class="form-check form-check-inline">
                    <input id="WorkContributedYes" class="form-check-input" type="radio" value="true" data-val="true" data-val-required="The Was the absence caused by an injury at work? field is required."
                        name="WorkContributed">
                    <label class="form-check-label" for="WorkContributedYes">
                        Yes
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input id="WorkContributedNo" class="form-check-input" type="radio" value="false" checked="checked" name="WorkContributed">
                    <label class="form-check-label" for="WorkContributedNo">
                        No
                    </label>
                </div>
            </fieldset>

            <fieldset class="form-group col-xs-12">
                <label for="WorkContributedDetails">If yes, give details:</label>
                <textarea class="form-control" id="WorkContributedDetails" name="WorkContributedDetails"></textarea>
                <span class="text-danger field-validation-valid" data-valmsg-for="WorkContributedDetails" data-valmsg-replace="true"></span>
            </fieldset>

            <div class="spacer"></div>

            <div class="form-row">
                <div class="col-xs-12">
                    <legend class="question-header"> Has the employee met any trigger points as outlined in the Managing Sickness Absence Procedure:</legend>
                </div>
                <fieldset class="form-group col-lg-4">
                    <legend class="matchH"> 14 or more calendar days of sickness absence (referral to occupational health required)</legend>
                    <div class="form-check form-check-inline">
                        <input id="TriggerDaysSicknessYes" class="form-check-input" type="radio" value="true" data-val="true" data-val-required="The Did you attend hospital? field is required."
                            name="TriggerDaysSickness">
                        <label class="form-check-label" for="TriggerDaysSicknessYes">
                            Yes
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input id="TriggerDaysSicknessNo" class="form-check-input" type="radio" value="false" checked="checked" name="TriggerDaysSickness">
                        <label class="form-check-label" for="TriggerDaysSicknessNo">
                            No
                        </label>
                    </div>
                </fieldset>

                <fieldset class="form-group col-lg-4">
                    <legend class="matchH"> 3 periods of sickness absence in a 3 month period</legend>
                    <div class="form-check form-check-inline">
                        <input id="TriggerSicknessPeriodsYes" class="form-check-input" type="radio" value="true" data-val="true" data-val-required="The Did you attend a clinic? field is required."
                            name="TriggerSicknessPeriods">
                        <label class="form-check-label" for="TriggerSicknessPeriodsYes">
                            Yes
                        </label>
                    </div>

                    <div class="form-check form-check-inline">
                        <input id="TriggerSicknessPeriodsNo" class="form-check-input" type="radio" value="false" checked="checked" name="TriggerSicknessPeriods">
                        <label class="form-check-label" for="TriggerSicknessPeriodsNo">
                            No
                        </label>
                    </div>
                </fieldset>

                <fieldset class="form-group col-lg-4">
                    <legend class="matchH">4 or more periods of sickness absence in a rolling 12 month period beginning on the first day of
                        absence</legend>
                    <div class="form-check form-check-inline">
                        <input id="Trigger12MonthPeriodYes" class="form-check-input" type="radio" value="true" data-val="true" data-val-required="The Did you attend a doctor? field is required."
                            name="Trigger12MonthPeriod">
                        <label class="form-check-label" for="Trigger12MonthPeriodYes">
                            Yes
                        </label>
                    </div>

                    <div class="form-check form-check-inline">
                        <input id="Trigger12MonthPeriodNo" class="form-check-input" type="radio" value="false" checked="checked" name="Trigger12MonthPeriod">
                        <label class="form-check-label" for="Trigger12MonthPeriodNo">
                            No
                        </label>
                    </div>
                </fieldset>
                <div class="clearfix"></div>
            </div>

            <div class="spacer"></div>

            <fieldset class="form-group col-xs-12">
                <legend class="question-header">Additional information</legend>
                    
                <p>If the employee is returning to work following an absence relating to any of the health conditions listed
                    below*, a referral to occupational health should be made immediately upon the employee’s return to
                    work and, if returning to a safety critical role, a referral to occupational health should be made
                    before returning to their normal role. You should also consider whether a risk assessment is required.</p>

                <p>* Hospital admission (e.g. surgery, heart attack, stroke), diabetes, epilepsy, has become registered
                    disabled, impaired vision or hearing, mental ill health (stress, anxiety and depression), musculoskeletal,
                    or work related accident.</p>

                <p>Please refer to Occupational Health Management Referral Guidance or contact Occupational.health@kier.co.uk
                    for further advice and guidance. </p>
            
                <hr />

                <label for="NextAction">Next Action</label>
                <select class="form-control" data-val="true" data-val-required="Next Action field is required." id="NextAction" name="NextAction">
                    <option>No Further Action</option>
                    <option>Employee to be invited to an informal/formal review meeting</option>
                    <option>Refer to occupational health</option>
                    <option>Investigate failure to follow reporting procedure</option>
                </select>
                <span class="text-danger field-validation-valid" data-valmsg-for="NextAction" data-valmsg-replace="true"></span>
            </div>

            <fieldset class="form-group col-xs-12">
                <label for="NextActionFurtherComments">Further Comments:</label>
                <textarea class="form-control" id="NextActionFurtherComments" name="NextActionFurtherComments"></textarea>
            </fieldset>

            <div class="spacer"></div>

            <fieldset class="form-group col-xs-12">
                <legend class="question-header">Please select your Line Manger</legend>
                <label>This will be used for approval of this form. </label>
                <div id="LineManager"></div>
                <span class="text-danger error-message" data-validation-element="LineManager_TopSpan_HiddenInput">*required</span>
            </fieldset>
            <div class="col-xs-12">
                <div class="my-3">
                    <div class="g-recaptcha" data-sitekey="6LehMGUUAAAAAAJeTwL9sla4eXlXifDh532qeodm" data-callback="recaptchaValidated"></div>
                </div>
                <p>By submitting this form I acknowledge that I understand that if I provide inaccurate or false information
                    about my absence, it may be treated as gross misconduct and could result in my summary dismissal from
                    the company.</p>
                <button type="button" id="submitReturnToWork" class="btn btn-primary">Submit</button>
                <input name="__RequestVerificationToken" type="hidden" value="CfDJ8GWwDReqfRdMuhGRBIqjlA-nSntZUWQCDIIfJrXyyV8NeZWkFpQjNDriVtlQB7Tgslx83q_wLa993W_LqkGvGYG2SEaS_kJMZpcPJIJqdW0PVGbTQ1azRuqkHLYU82d8XkLHPsxt5OnxEr_1XrxBR4o"
                />
            </div>  
        </div>
    </div>

    <div class="completed-panel row col-xs-12">
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
    <script src="./js/returntowork.js"></script>
</asp:content>