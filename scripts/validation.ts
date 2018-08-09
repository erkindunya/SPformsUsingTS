export const validateForm = () => {
  let isFormValid = true;

  $('span[data-validation-element]').each(function () {
    // TODO: define validation element types, currently just goes of if required and custom regex
    let isElementValid = true;

    const element = $('#' + $(this).attr('data-validation-element'));

    if ($(element).val() === '')
      isElementValid = false;
    
    if (!isElementValid) {
      isFormValid = false;
      $(this).css('visibility', 'visible');
    }else {
      $(this).css('visibility', 'hidden');
    }

  });

  console.log(isFormValid);

  return isFormValid;
};
