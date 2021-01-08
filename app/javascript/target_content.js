window.addEventListener('load', () => {
  console.log("OK");

  const weightInput = document.getElementById("body_weight");

  weightInput.addEventListener("input", () => {
    const inputValue = weightInput.value;
    console.log("自身の体重");

    const addTargetValue = document.getElementById("target_value");
  const weight = (inputValue * 3);
  console.log("目標値");
  addTargetValue.innerHTML = Math.floor(weight);

});
});