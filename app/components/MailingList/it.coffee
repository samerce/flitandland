import React, {useState} from 'react'

import * as l from './styled'
import * as c from '../../constants'

PlaceholderDefault = 'join the mailing list!'

export default MailingList = =>
  [email, setEmail] = useState null
  [placeholder, setPlaceholder] = useState PlaceholderDefault
  [canSubmit, setCanSubmit] = useState false
  onFocus = =>
    setPlaceholder 'enter email address'
  onBlur = =>
    setPlaceholder PlaceholderDefault
  onChange = ({target}) =>
    email = target.value
    setEmail email
    setCanSubmit (email.length > 0) and (email.includes '@') and (email.includes '.')

  <l.Root id="mc_embed_signup">
    <form action="https://purplerepublic.us16.list-manage.com/subscribe/post?u=1845fafc4ec12fea1325f3444&amp;id=13479fec2a" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" className="validate" target="_blank" noValidate>
      <div id="mc_embed_signup_scroll">
        <l.EmailInput type="email" name="EMAIL" className="email" id="mce-EMAIL"
        placeholder={placeholder} required onFocus={onFocus} onBlur={onBlur}
        onChange={onChange}
        />
        <div aria-hidden="true" className='hiddenInput'><input type="text" name="b_1845fafc4ec12fea1325f3444_13479fec2a" tabIndex="-1" defaultValue="" /></div>
        <l.JoinButton type="submit" value="join" name="subscribe" id="mc-embedded-subscribe" className={"button " + (canSubmit and 'show')} />
      </div>
    </form>
  </l.Root>
