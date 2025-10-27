import dayjs from "dayjs";
import "./style.css";

function main() {
  const dateElem = document.querySelector("#date");
  const timeElem = document.querySelector("#time");

  function updateDate() {
    const currentTime = dayjs();
    dateElem.textContent = currentTime.format("YYYY.MM.DD");
  }

  function updateTime() {
    const currentTime = dayjs();
    timeElem.textContent = currentTime.format("HH:mm:ss");
  }

  updateDate();
  setInterval(updateTime, 500);
}

main();
