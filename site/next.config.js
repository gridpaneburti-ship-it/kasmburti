/** @type {import('next').NextConfig} */

const nextConfig = {
  output: 'export',
  distDir: '../public',
  env: {
    name: 'GridPaneBurti Workspaces',
    description: 'Custom KDE Plasma workspaces for Kasm',
    icon: '/img/logo.svg',
    listUrl: 'https://gridpaneburti-ship-it.github.io/kasmburti/',
    contactUrl: 'https://github.com/gridpaneburti-ship-it/kasmburti/issues',
  },
  reactStrictMode: true,
  basePath: '/kasmburti/1.0',
  trailingSlash: true,
  images: {
    unoptimized: true,
  }
}

module.exports = nextConfig
