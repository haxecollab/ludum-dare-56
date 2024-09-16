package;

using StringTools;

class Main {
	static function main() {
		final xml = Xml.parse(sys.io.File.getContent("../../../contributors.xml"));
		final access = new haxe.xml.Access(xml.firstElement());
		final template = new haxe.Template(sys.io.File.getContent("src/template.mtt"));

		for (c in access.nodes.contributor) {
			// Generate markdown file
			var contributor = {
				name: (c.node.name.innerData: String).trim(),
				github: (c.node.github.innerData: String).trim(),
				description: (c.node.description.innerData: String).trim(),
				role: (c.node.role.innerData: String).trim(),
				hasLinks: false,
				links: []
			};
			if (c.hasNode.links) {
				trace("links");
				contributor.links = [for (l in c.node.links.nodes.link) {title: (l.att.title: String).trim(), link: (l.innerData: String).trim()}];
				contributor.hasLinks = true;
			}

			final output = template.execute(contributor).trim();
			sys.io.File.saveContent('../../../credits/${contributor.github}.md', output);

			// Save avatar
			var avatar = haxe.Http.requestUrl('https://avatars.githubusercontent.com/${contributor.github}');
			sys.io.File.saveContent('../../../assets/avatars/${contributor.github}.png', avatar);
		}
	}
}
