import { posts } from '../../src/data/blogData'

export default defineEventHandler((event) => {
  const config = useRuntimeConfig()
  const base = (config.public?.siteUrl as string) || 'https://ambro.space'

  const staticPaths = [
    '',
    '/blog/java',
    '/blog/python',
    '/blog/ai-basic',
    '/blog/ai-insight',
    '/about',
    '/about/apps',
    '/contact',
    '/privacy',
    '/utils',
    '/utils/camel-converter',
    '/utils/json-formatter',
    '/utils/regex-tester',
    '/utils/sql-formatter',
    '/apps/aicent/ongi',
    '/apps/play/nunchi-game',
    '/apps/mate/water-buddy',
    '/apps/mate/pill-ping'
  ]

  const urls = staticPaths.map((path) => ({
    loc: `${base}${path}`,
    lastmod: new Date().toISOString().split('T')[0],
    changefreq: path === '' ? 'daily' : 'weekly' as const,
    priority: path === '' ? 1 : 0.8
  }))

  posts.forEach((post) => {
    urls.push({
      loc: `${base}/blog/${post.category}/${post.fileName}`,
      lastmod: post.date,
      changefreq: 'monthly' as const,
      priority: 0.9
    })
  })

  const xml = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${urls
  .map(
    (u) =>
      `  <url>
    <loc>${escapeXml(u.loc)}</loc>
    <lastmod>${u.lastmod}</lastmod>
    <changefreq>${u.changefreq}</changefreq>
    <priority>${u.priority}</priority>
  </url>`
  )
  .join('\n')}
</urlset>`

  setHeader(event, 'Content-Type', 'application/xml')
  setHeader(event, 'Cache-Control', 'public, max-age=3600')
  return xml
})

function escapeXml(s: string): string {
  return s
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;')
}
