/**
 * 
 */
 
 const loanTerm = document.getElementById("loanTerm");
const interestRate = document.getElementById("interestRate");
const compareInterest = document.getElementById("compareInterest");
const loanAmount = document.getElementById("loanAmount");
const cal_term = document.getElementById("cal_term");
const cal_amount = document.getElementById("cal_amount");
const cal_rate = document.getElementById("cal_rate");

function calculateInterest() {
  $("#compareInterest").empty();
  // 원리금균등상환
  let term = parseInt(loanTerm.value);
  let rate = parseFloat(interestRate.value);
  let amount = parseInt(loanAmount.value);
  let rate2 = rate / 12;
  let rate3 = 1 + rate2;
  let rate4 = rate / 12;
  let base_rate = 1;

  cal_term.innerText = term + "개월";
  cal_amount.innerText = amount.toLocaleString("en-US") + "원";
  cal_rate.innerText = (rate * 100).toFixed(2) + "%";

  for (let i = 0; i < term; i++) {
    base_rate = base_rate * rate3;
  }

  let levelPayment = (amount * rate2 * base_rate) / (base_rate - 1);
  //   console.log(levelPayment);

  //원금만기 일시상환
  let balloonLoanInterest = (amount * rate) / 12;

  // 원금균등상환
  let balance = amount;
  let levelPayment2 = 1;
  let sum = 0;

  for (let i = 0; i < term; i++) {
    let ctr = document.createElement("tr");
    let ctd = document.createElement("td");
    ctd.innerText = i + 1;
    ctr.appendChild(ctd);

    let ctd0 = document.createElement("td");
    if(i < term-1){
        ctd0.innerText =
        Math.floor(balloonLoanInterest).toLocaleString("en-US") + "원";
    } else{
        ctd0.innerText =
      Math.floor(balloonLoanInterest + amount).toLocaleString("en-US") + "원";
    }
   
    ctr.appendChild(ctd0);

    let ctd1 = document.createElement("td");
    ctd1.innerText = Math.floor(levelPayment).toLocaleString("en-US") + "원";
    ctr.appendChild(ctd1);

    balance = balance - levelPayment2;
    levelPayment2 =(amount / term + balance * rate4);
    sum = sum + levelPayment;

    let ctd2 = document.createElement("td");
    ctd2.innerText = Math.floor(levelPayment2).toLocaleString("en-US") + "원";
    ctr.appendChild(ctd2);
    compareInterest.appendChild(ctr);
  }

  //   총이자
  let ctr2 = document.createElement("tr");
  let ctd2 = document.createElement("td");
  ctd2.innerText = "총이자";
  ctr2.appendChild(ctd2);
  ctr2.setAttribute("style","background-color:var(--color-hana-green-2);font-weight:600;");
  compareInterest.appendChild(ctr2);

  let ctd3 = document.createElement("td");
  ctd3.innerText = Math.floor(balloonLoanInterest*term).toLocaleString("en-US") + "원";
  ctr2.appendChild(ctd3);
  compareInterest.appendChild(ctr2);

  let ctd4 = document.createElement("td");
  ctd4.innerText = Math.floor((levelPayment*term)-amount).toLocaleString("en-US") + "원";
  ctr2.appendChild(ctd4);
  compareInterest.appendChild(ctr2);

  let ctd5 = document.createElement("td");
  ctd5.innerText = Math.floor(sum-amount).toLocaleString("en-US") + "원";
  ctr2.appendChild(ctd5);
  compareInterest.appendChild(ctr2);
}
