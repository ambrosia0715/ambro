import { defineNuxtConfig } from 'nuxt/config'

export default defineNuxtConfig({
  srcDir: 'src/',
  modules: ['@nuxt/content'],
  content: {
    experimental: {
      sqliteConnector: 'native'
    }
  },
  typescript: {
    strict: true,
    typeCheck: false
  },
  app: {
    head: {
      title: 'Ambro Tech Blog - AI, Java, Python 기술 블로그',
      htmlAttrs: {
        lang: 'ko'
      },
      meta: [
        { charset: 'utf-8' },
        {
          name: 'viewport',
          content:
            'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no'
        },
        {
          name: 'description',
          content:
            'AI 개발, Java, Python 등 실무 개발 지식과 최신 기술 트렌드를 공유하는 Ambro Tech Blog입니다.'
        },
        {
          name: 'keywords',
          content:
            'AI, Java, Python, Spring Boot, 바이브코딩, 기술블로그, 개발자'
        },
        {
          name: 'naver-site-verification',
          content: '3950b7e8fb9f37b138fdaee4034c393ed1c24bc8'
        },
        { name: 'apple-mobile-web-app-capable', content: 'yes' },
        { name: 'apple-mobile-web-app-status-bar-style', content: 'black' },
        { name: 'apple-mobile-web-app-title', content: 'Ambro Tech Blog' },
        { property: 'og:type', content: 'website' },
        {
          property: 'og:title',
          content: 'Ambro Tech Blog - AI, Java, Python 기술 블로그'
        },
        {
          property: 'og:description',
          content: 'AI 개발, Java, Python 등 실무 개발 지식과 최신 기술 트렌드를 공유합니다.'
        },
        { property: 'og:site_name', content: 'Ambro Tech Blog' }
      ],
      link: [
        { rel: 'canonical', href: 'https://ambro.space/' },
        { rel: 'sitemap', type: 'application/xml', href: '/sitemap.xml' },
        {
          rel: 'alternate',
          type: 'application/rss+xml',
          title: 'Ambro Tech Blog RSS',
          href: '/rss.xml'
        }
      ],
      script: [
        {
          src: 'https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-1444459980078427',
          async: true,
          crossorigin: 'anonymous'
        }
      ]
    }
  },
  runtimeConfig: {
    public: {
      siteUrl: 'https://ambro.space'
    }
  }
})

