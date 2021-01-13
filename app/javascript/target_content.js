window.addEventListener('load', () => {
  console.log("OK");

  const weightInput = document.getElementById("body_weight");
  weightInput.addEventListener("input", () => {
    const inputValue = weightInput.value;
    console.log("自身の体重");

    const selectCourse = document.getElementById("course_name_id");
    selectCourse.addEventListener("change", () => {
      const selectValue = selectCourse.value
      console.log("要素の取得確認");

    if (selectValue == 1.2){
      selectValue == 1.2
      console.log("選択したコース1");
    } else if (selectValue == 1.6){
      selectValue == 1.6
      console.log("選択したコース2");
    } else {
      selectValue == 2
      console.log("選択したコース3");
    }
   
      
    const addTargetValue = document.getElementById("target_value");
  const weight = (inputValue * selectValue);
  console.log("目標値");
  addTargetValue.innerHTML = Math.floor(weight);

});
});
});