// google url is configured for cdn caching by default
export const GOOGLE_URL = 'https://storage.googleapis.com/purple-republic/'
export const S3_URL = 'https://s3.amazonaws.com/purplerepublic.us/'
export const CDN_URL = 'https://d3sclm0qnx89jv.cloudfront.net/'
export const OPT_URL_ROOT = 'https://res.cloudinary.com/eym/image/fetch/q_auto/'
export const OPT_URL = OPT_URL_ROOT + CDN_URL
export const SRC_URL = process.env.NODE_ENV === 'production' ? OPT_URL : CDN_URL
export const FAL_URL = SRC_URL + 'flitandland/'

export const YOUTUBE_URL =
  'https://www.youtube.com/channel/UCne9Pv9CARxNz8rNMaDm7Dw';
export const PATREON_URL = 'https://www.patreon.com/expressyourmess';
export const InstagramUrl = 'https://www.instagram.com/expressyourmess';
export const MEDIUM_URL = 'https://www.medium.com/the-purple-republic';
export const MediumUrl = 'https://www.medium.com/the-purple-republic';
export const EMAIL_URL = 'mailto:whynot@expressyourmess.com';
export const SOUNDCLOUD_URL = 'https://soundcloud.com/expressyourmess';
export const LAMPSHADE_TUMBLR_URL = 'http://ypsilampshade.tumblr.com/';
export const TwitterUrl = 'https://twitter.com/expressyourmess';
export const EtsyUrl = 'https://etsy.com/shop/expressyourmess';
export const YouTubeUrl = 'https://www.youtube.com/channel/UCne9Pv9CARxNz8rNMaDm7Dw';
export const BookUrl = 'https://www.amazon.com/gp/product/171000892X/'
export const GoogleBookPreview = 'https://books.google.com/books?id=RxPRDwAAQBAJ&newbks=0&printsec=frontcover#v=onepage&q&f=false'

export const EASE_OUT_SINE = 'cubic-bezier(0.25, 0.1, 0.25, 1)';
export const EASE_IN_SINE = 'cubic-bezier(0.42, 0, 1, 1)';
export const EASE_SINE = 'cubic-bezier(0.445, 0.05, 0.55, 0.95)';
export const EASE_OUT = 'cubic-bezier(0.2, .8, 0.2, 1)';
export const EASE_IN = 'cubic-bezier(0.755, 0.05, 0.855, 0.06)';
export const EASE = 'cubic-bezier(0.86, 0, 0.07, 1)';
export const Sexy = 'cubic-bezier(.27,.49,0,.98)'//'cubic-bezier(.43,0,.13,.99)';

export const SCREEN_WIDTH_S = 375;
export const SCREEN_WIDTH_MMS = 425;
export const SCREEN_WIDTH_MS = 628;
export const SCREEN_WIDTH_M = 768;
export const SCREEN_WIDTH_ML = 924;
export const SCREEN_WIDTH_L = 1024;
export const SCREEN_WIDTH_XL = 1366;
export const SCREEN_WIDTH_XXL = 1440;
export const SCREEN_WIDTH_XXXL = 2156;

export const SCREEN_WIDTH_S_PX = `${SCREEN_WIDTH_S}px`;
export const SCREEN_WIDTH_M_PX = `${SCREEN_WIDTH_M}px`;
export const SCREEN_WIDTH_L_PX = `${SCREEN_WIDTH_L}px`;
export const SCREEN_WIDTH_XL_PX = `${SCREEN_WIDTH_XL}px`;

export const GalleryBaseKey = 'bubbles/galleryImages/';
export const GalleryBaseUrl = SRC_URL + GalleryBaseKey;
