module ApplicationHelper

  def set_focus_to_first_field
    raw <<-EMBED_SCRIPT
      <script type="text/javascript">
        $(document).ready(function () {
          $("input:visible:enabled:first").focus();
        });
      </script>
    EMBED_SCRIPT
  end

end
