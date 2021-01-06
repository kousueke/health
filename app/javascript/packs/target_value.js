window.addEventListener('load', () => {
  console.log("OK");

  const weightInput = document.getElementById("body_weight");

  weightInput.addEventListener("input", () => {
    const inputValue = weightInput.value;

    const addTargetValue = document.getElementById("target_value");
  const weight = (inputValue * 1.5);
  addTargetValue.innerHTML = Math.floor(weight);

});
});