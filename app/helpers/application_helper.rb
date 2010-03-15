module ApplicationHelper

  def set_focus_to_id(id)
    raw <<-EMBED_SCRIPT
      <script type="text/javascript">
        $(document).ready(function () {
          $('\##{id}').focus();
        });
      </script>
    EMBED_SCRIPT
  end

end
