import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
const BASE = '/docs/'
export default defineConfig({
  title: "WireKCP",
  description: "A KCP-based WireGuard VPN.",
  head: [
    ['link', { rel: 'icon', type: 'image/jfif', href: `${BASE}logo.jfif` }],
  ],
  base: BASE,
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    logo: { src: `/logo.jfif`, alt: 'WireKCP Logo'},

    nav: [
      { text: 'Home', link: '/' },
      { text: 'Guide', link: '/guide/get-started' },
    ],

    sidebar: [
      {
        text: 'Introduction',
        items: [
          { text: 'Getting Started', link: '/guide/get-started' },
          { text: 'Advanced Commands', link: '/guide/advanced' }
        ]
      },
      {
        text: 'Examples',
        items: [
          { text: 'Configuration Examples', link: '/configuration-examples' }
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/wirekcp/wirekcp' }
    ]
  }
})
