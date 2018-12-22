<!--app.tag-->
<app>
  <div class="container-fluid">
    <div class="row">
      <div class="col-6">
        <app-editor editor="{ editor }"></app-editor>
      </div>
      <div class="col-6">
        <app-preview editor="{ editor }"></app-preview>      
      </div>
    </div>
  </div>
  <style>
    .container-fluid{
      position: absolute;
      padding: 0;
      top: 0;
      bottom: 0;
      right: 0;
      left: 0;
    }
    .row {
      padding: 0px;
      height: 100%;
    }
  </style>
  <script>
    import './editor.tag';
    import './preview.tag';

    this.editor = riot.observable();
  </script>
</app>