package ui;

@:xml('
<vbox width="100%" height="100%" style="padding:12">
	<button id="back" text="Back" />
    <vbox width="100%" height="100%" verticalAlign="center" horizontalAlign="center">
        <savebutton saveId="1" />
        <savebutton saveId="2" />
        <savebutton saveId="3" />
    </vbox>
</vbox>
')
class LoadScreen extends haxe.ui.containers.VBox {}
