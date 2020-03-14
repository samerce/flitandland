const nodemailer = require('nodemailer')

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    type: 'OAuth2',
    user: 'whynot@expressyourmess.com',
    serviceClient: '105522123445258264150',
    privateKey: process.env.GMAIL_OAUTH_KEY,
  }
})

module.exports = {
  sendMail: (params) => {
    transporter.sendMail({
      from: '"skitzy from express your mess" <whynot@expressyourmess.com>',
      subject: 'a message from express your mess',
      ...params
    })
  }
}

/*
  email format:

  from: '"Fred Foo 👻" <foo@example.com>', // sender address
  to: "bar@example.com, baz@example.com", // list of receivers
  subject: "Hello ✔", // Subject line
  text: "Hello world?", // plain text body
  html: "<b>Hello world?</b>" // html body
*/
