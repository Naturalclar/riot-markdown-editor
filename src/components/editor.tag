<!--editor.tag-->
<app-editor>
  <div id="editor"></div>
  <style>
    #editor {
      position: absolute;
      top:0;
      left: 0;
      right: 0;
      bottom: 0;
    }
  </style>
  <script>
    import ace from 'brace';
    import 'brace/mode/markdown';
    import 'brace/theme/monokai';

    $(document).ready(() => {
      //Initialize Editor
      this.editor = ace.edit('editor');
      this.editor.getSession().setMode('ace/mode/markdown');
      this.editor.setTheme('ace/theme/monokai');
      this.editor.setFontSize(14);
      this.editor.getSession().setUseWrapMode(true);
      this.editor.getSession().setTabSize(2);

      this.editor.getSession().on('change', () =>{ 
        this.opts.editor.trigger('change', this.editor.getValue());
      });
      
      this.editor.setValue([
        '# Riot Markdown Editor',
        'This is a simple markdown editor created with `Electron` and `Riot.js`.',
        '```js',
        `const foo = 'Syntax Highlighting is supported.'`,
        '```',
        'You can check out this repository at my [Github Page](https://github.com/Naturalclar/riot-markdown-editor).'
      ].join('\n\n'));

    });
  </script>
</app-editor>