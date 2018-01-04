<!--preview.tag-->
<app-preview>
  <div class="test">
    <article class="markdown-body"></article>
  </div>
  <style>
    .test {
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
    }
    article {
      box-sizing: border-box;
      padding: 12px;
      overflow: auto;
      max-height: 100%;
    }
  </style>
  <script>
    import MarkDownIt from 'markdown-it';
    import hljs from 'highlight.js';
    hljs.initHighlightingOnLoad();
    
    this.opts.editor.on('change', data => {
      const md = new MarkDownIt();
      const result = md.render(data);

      $('article').html(result);
      $('pre code').each((i, block) => {
        hljs.highlightBlock(block);
      });
    });
  </script>
</app-preview>