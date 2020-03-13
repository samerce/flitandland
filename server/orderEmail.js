module.exports = (p) => `
<!doctype html>
<html lang='en' style="background: #d10079;font-family: crimson pro;font-size: 18px;text-align: center;color: white;">

<head>
  <meta charset='utf-8'>
  <link href='https://fonts.googleapis.com/css?family=Crimson+Pro&display=swap' rel='stylesheet'>
  <line href='https://d3sclm0qnx89jv.cloudfront.net/fonts/eymFonts.css' rel="stylesheet" type="text/css">
</head>

<body style="background: #d10079;font-family: crimson pro;font-size: 18px;text-align: center;color: white;padding: 27px;">
  <h1 style="font-family: big john; color: white;">thank you!</h1>
  <h2 style="font-family: slim joe;font-weight: 900; color: white;">your book has been ordered</h2>
  <p style="font-family: big john;">
    <span style="font-family: slim joe; font-weight: 900;">order</span> ${p.orderId}
  </p>
  <img style="height: 324px;" src='https://res.cloudinary.com/eym/image/fetch/q_auto/https://d3sclm0qnx89jv.cloudfront.net/commons/dqitwh cover mq.jpg' />

  <p>
    <span style="font-family: slim joe; font-weight: 900;">
      you paid
      <br />
    </span>
    <span style="font-family: big john;">$${p.total}</span>
    <br />
    <a href='${p.receiptUrl}' style="color: white;">
      receipt
    </a>
  </p>
  <p style="color: white;">
    <br />
    <span style="font-family: slim joe; font-weight: 900;">
      shipping to
      <br />
    </span>
    ${p.recipient.display_name}
    <br />
    ${p.recipient.address.address_line_1}
    <br />
    ${p.recipient.address.locality}, ${p.recipient.address.administrative_district_level_1} ${p.recipient.address.postal_code}
    <br/>
    <a style="color: white;" href='mailto:${p.recipient.email_address}'>${p.recipient.email_address}</a>
  </p>
  <br />
  <p style="color: white;">reply to this email to change or cancel your order.</p>
  <p style="color: white;">we'll email you once your order has shipped!</p>
  <br />
  <p style="font-family: slim joe; font-weight: 900; color: white;">namaste, beautiful creature</p>
  <h1 style="font-family: big john; color: white;">express your mess</h1>
</body>

</html>
`
