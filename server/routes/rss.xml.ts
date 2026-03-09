import { posts } from '../../src/data/blogData'

export default defineEventHandler((event) => {
  const config = useRuntimeConfig()
  const base = (config.public?.siteUrl as string) || 'https://ambro.space'

  const sortedPosts = [...posts].sort((a, b) =>
    b.date.localeCompare(a.date)
  ).slice(0, 50)

  const rss = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>Ambro Tech Blog</title>
    <link>${escapeXml(base)}</link>
    <description>AI 개발, Java, Python 등 실무 개발 지식과 최신 기술 트렌드 - Ambro Tech Blog</description>
    <language>ko</language>
    <lastBuildDate>${new Date().toUTCString()}</lastBuildDate>
    <atom:link href="${escapeXml(base)}/rss.xml" rel="self" type="application/rss+xml"/>
${sortedPosts
  .map(
    (p) => `    <item>
      <title>${escapeXml(p.title)}</title>
      <link>${escapeXml(`${base}/blog/${p.category}/${p.fileName}`)}</link>
      <description>${escapeXml(p.description)}</description>
      <pubDate>${new Date(p.date).toUTCString()}</pubDate>
      <guid isPermaLink="true">${escapeXml(`${base}/blog/${p.category}/${p.fileName}`)}</guid>
    </item>`
  )
  .join('\n')}
  </channel>
</rss>`

  setHeader(event, 'Content-Type', 'application/rss+xml; charset=utf-8')
  setHeader(event, 'Cache-Control', 'public, max-age=3600')
  return rss
})

function escapeXml(s: string): string {
  return s
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;')
}
