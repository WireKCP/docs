import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "WireKCP",
  description: "A KCP-based WireGuard VPN.",
  head: [
    ['link', { rel: 'icon', type: 'image/jfif', href: '/logo.jfif' }],
  ],
  base: '/docs/',
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    logo: { src: 'logo.jfif', alt: 'WireKCP Logo'},

    nav: [
      { text: 'Home', link: '/' },
      { text: 'Guide', link: '/guide/get-started' },
    ],

    sidebar: [
      {
        text: 'Introduction',
        items: [
          { text: 'Getting Started', link: '/guide/get-started' }
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
      { icon: 'github', link: 'https://github.com/vuejs/vitepress' }
    ]
  }
})
