const SquareConnect = require('square-connect')

const isProd = process.env.NODE_ENV === 'production'

module.exports = {
  initSquare: () => {
    const defaultClient = SquareConnect.ApiClient.instance

    const oauth2 = defaultClient.authentications['oauth2']
    oauth2.accessToken = process.env.SQUARE_ACCESS_TOKEN

    defaultClient.basePath = isProd?
      'https://connect.squareup.com' : 'https://connect.squareupsandbox.com'
  },
  SquareLocationId: isProd? 'CWMV8TTJ1ZACA' : 'TPWBYE84W506V'
}
