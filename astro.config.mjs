import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import rehypeMermaid from 'rehype-mermaid';
import addMermaidClass from './add-mermaid-classname';
import sitemap from '@astrojs/sitemap';

// https://astro.build/config
export default defineConfig({
	site: 'https://perebaj.github.io',
	integrations: [mdx(), sitemap()],
	markdown: {
		rehypePlugins: [addMermaidClass, rehypeMermaid]
	}
});
