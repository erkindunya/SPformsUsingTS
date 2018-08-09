import { sp, Web } from './lib/sp';
import * as $ from 'jquery';
import { ItemAddResult, ItemUpdateResult } from 'sp-pnp-js/lib/pnp';
import { validateForm } from './validation';

interface SelfCertSubmission {
  Title: string;
  Name: string;
  Employee_x0020_Number: string;
  Employing_x0020_Company: string;
  Site_x002f_Department: string;
  First_x0020_Day_x0020_of_x0020_A: Date;
  Returned_x0020_to_x0020_Work: Date;
  Length_x0020_of_x0020_Absence: number;
  Reason_x0020_for_x0020_Absence: string;
  Injury_x0020_at_x0020_work: boolean;
  Attend_x0020_Hospital: boolean;
  Attend_x0020_Clinic: boolean;
  Attend_x0020_Doctor: boolean;
  Address_x0020_of_x0020_attendanc: string;
  Taking_x0020_Medication: boolean;
  Line_x0020_ManagerId : string;
}

const saveForm = (submission: SelfCertSubmission) => {
  console.log(submission);
  sp.web.lists
    .getByTitle('Self Cert')
    .items.add(submission)
    .then((iar: ItemAddResult) => {
      console.log(iar);
    });
};


$(document).on('click','#submitSelfCert', async () => {

  if (validateForm()) {
    const lineManagerInfo = JSON.parse($('#LineManager_TopSpan_HiddenInput').val() as string);
    let lineManagerId = '';

    await sp.web.siteUsers.getByLoginName (
      lineManagerInfo[0].Key).get().then((result) => {
        console.log(result.Id);
        lineManagerId = result.Id as string;
      });

    const inputData : SelfCertSubmission = {
      Title: $('#Name').val() as string,
      Name: $('#Name').val() as string,
      Employee_x0020_Number: $('#EmployeeNumber').val() as string,
      Employing_x0020_Company: $('#EmployingCompany').val() as string,
      Site_x002f_Department: $('#Department').val() as string,
      First_x0020_Day_x0020_of_x0020_A: new Date($('#StartDate').val() as string),
      Returned_x0020_to_x0020_Work: new Date($('#EndDate').val() as string),
      Length_x0020_of_x0020_Absence: $('#AbsenceLength').val() as number,
      Reason_x0020_for_x0020_Absence: $('#AbsenceReason').val() as string,
      Injury_x0020_at_x0020_work: $('input[name="CausedByWork"]:checked').val() === 'true',
      Attend_x0020_Hospital: $('input[name="AttendedHospital"]:checked').val() === 'true',
      Attend_x0020_Clinic: $('input[name="AttendedClinic"]:checked').val() === 'true',
      Attend_x0020_Doctor: $('input[name="AttendedDoctor"]:checked').val() === 'true',
      Address_x0020_of_x0020_attendanc: $('#DetailsAttended').val() as string,
      Taking_x0020_Medication: $('input[name="TakingMedication"]:checked').val() === 'true',
      Line_x0020_ManagerId: lineManagerId ,
    };

    saveForm(inputData);
    $('.form-panel').hide();
    $('.completed-panel').show();
  }
});
