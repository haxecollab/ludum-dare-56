package;

using StringTools;

typedef Contributor = {
	name: String,
	github: String,
	description: String,
	role: String,
	hasLinks: Bool,
	links: Array<{title: String, link: String}>
};

class Contributors {
	public static macro function getContributors() {
		#if macro
		var contributors: Array<haxe.macro.Expr> = [];
		final xml = Xml.parse(sys.io.File.getContent("contributors.xml"));
		final access = new haxe.xml.Access(xml.firstElement());

		for (c in access.nodes.contributor) {
			// Generate markdown file
			var contributor: Contributor = {
				name: (c.node.name.innerData: String).trim(),
				github: (c.node.github.innerData: String).trim(),
				description: (c.node.description.innerData: String).trim(),
				role: (c.node.role.innerData: String).trim(),
				hasLinks: false,
				links: []
			};
			if (c.hasNode.links) {
				contributor.links = [for (l in c.node.links.nodes.link) {title: (l.att.title: String).trim(), link: (l.innerData: String).trim()}];
				contributor.hasLinks = true;
			}
			contributors.push(macro $v{contributor});
		}

		return macro $a{contributors};
		#end
	}
}
