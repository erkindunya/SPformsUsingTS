import { sp, Web } from './lib/sp';
import * as $ from 'jquery';
import { ItemAddResult, ItemUpdateResult } from 'sp-pnp-js/lib/pnp';
import { validateForm } from './validation';


interface ReturnToWorkSubmission {
  Title: string;
  Name: string;
  Employee_x0020_Number: string;
  Employing_x0020_Company: string;
  Site_x002f_Department: string;
  First_x0020_Day_x0020_of_x0020_A: Date;
  Returned_x0020_to_x0020_Work: Date;
  Length_x0020_of_x0020_Absence: number;
  Reason_x0020_for_x0020_Absence: string;
  Properly_x0020_Notified_x0020_Em: boolean;
  Has_x0020_GP_x0020_Recommendatio: boolean;
  GP_x0020_Recommendations: string;
  Further_x0020_Absence_x0020_Anti: boolean;
  Further_x0020_Absence_x0020_Deta: string;
  Helping_x0020_Measures_x0020_Ide: boolean;
  Helping_x0020_Measures_x0020_Det: string;
  Work_x0020_Environment_x0020_Con: boolean;
  Work_x0020_Environment_x0020_Det: string;
  Trigger_x0020_14_x0020_Calendar_: boolean;
  Trigger_x0020_3_x0020_Periods_x0: boolean;
  Trigger_x0020_4_x0020_Periods_x0: boolean;
  Next_x0020_Action: string;
  Next_x0020_Action_x0020_Further_: string;
  Line_x0020_ManagerId : string;
}

const saveForm = (submission: ReturnToWorkSubmission) => {
  console.log(submission);
  sp.web.lists
    .getByTitle('Return To Work')
    .items.add(submission)
    .then((iar: ItemAddResult) => {
      console.log(iar);
    });
};


$(document).on('click','#submitReturnToWork', async () => {

  if (validateForm()) {
    const lineManagerInfo = JSON.parse($('#LineManager_TopSpan_HiddenInput').val() as string);
    let lineManagerId = '';

    await sp.web.siteUsers.getByLoginName (
      lineManagerInfo[0].Key).get().then((result) => {
        console.log(result.Id);
        lineManagerId = result.Id as string;
      });

    const inputData : ReturnToWorkSubmission = {
      Title: $('#Name').val() as string,
      Name: $('#Name').val() as string,
      Employee_x0020_Number: $('#EmployeeNumber').val() as string,
      Employing_x0020_Company: $('#EmployingCompany').val() as string,
      Site_x002f_Department: $('#Department').val() as string,
      First_x0020_Day_x0020_of_x0020_A: new Date($('#StartDate').val() as string),
      Returned_x0020_to_x0020_Work: new Date($('#EndDate').val() as string),
      Length_x0020_of_x0020_Absence: $('#AbsenceLength').val() as number,
      Reason_x0020_for_x0020_Absence: $('#AbsenceReason').val() as string,
      Properly_x0020_Notified_x0020_Em: $('input[name="EmployeeNotified"]:checked').val() === 'true',
      Has_x0020_GP_x0020_Recommendatio: $('input[name="GPRecommendation"]:checked').val() === 'true',
      GP_x0020_Recommendations: $('#GPRecommendationDetails').val() as string,
      Further_x0020_Absence_x0020_Anti: $('input[name="FurtherAbsences"]:checked').val() === 'true',
      Further_x0020_Absence_x0020_Deta: $('#FurtherAbsencesDetails').val() as string,
      Helping_x0020_Measures_x0020_Ide: $('input[name="Measures"]:checked').val() === 'true',
      Helping_x0020_Measures_x0020_Det: $('#MeasuresDetails').val() as string,
      Work_x0020_Environment_x0020_Con: $('input[name="WorkContributed"]:checked').val() === 'true',
      Work_x0020_Environment_x0020_Det: $('#WorkContributedDetails').val() as string,
      Trigger_x0020_14_x0020_Calendar_: $('input[name="TriggerDaysSickness"]:checked').val() === 'true',
      Trigger_x0020_3_x0020_Periods_x0: $('input[name="TriggerSicknessPeriods"]:checked').val() === 'true',
      Trigger_x0020_4_x0020_Periods_x0: $('input[name="Trigger12MonthPeriod"]:checked').val() === 'true',
      Next_x0020_Action: $('#NextAction').val() as string,
      Next_x0020_Action_x0020_Further_: $('#NextActionFurtherComments').val() as string,
      Line_x0020_ManagerId: lineManagerId ,
    };

    saveForm(inputData);
    $('.form-panel').hide();
    $('.completed-panel').show();
  }
});
