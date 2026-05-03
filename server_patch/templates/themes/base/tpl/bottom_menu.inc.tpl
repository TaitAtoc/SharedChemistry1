  <nav class="bottom_nav">
      <span class="sharedchemistry-footer-brand">
        <img src="{url_tpl_img}sharedchemistry/logo.png" alt="SharedChemistry" class="sharedchemistry-footer-logo" />
        <span>SharedChemistry</span>
      </span>
      <a rel="nofollow" href="{{ $design->url('page','main','about') }}" data-load="ajax">{lang 'About SharedChemistry'}</a>
      <a href="{{ $design->url('page','main','about') }}" title="{lang 'About Us'}" data-load="ajax">{lang 'About'}</a>
      <a href="{{ $design->url('page','main','helpus') }}" title="{lang 'Help Us'}" data-load="ajax">{lang 'Help'}</a>
      <a href="{{ $design->url('page','main','faq') }}" title="{lang 'Frequently Asked Questions'}">{lang 'FAQ'}</a>
      <a href="{{ $design->url('page','main','terms') }}" title="{lang 'Terms of Use'}" data-load="ajax">{lang 'Terms of Use'}</a>
      <a href="{{ $design->url('page','main','privacy') }}" title="{lang 'Privacy Policy'}" data-load="ajax">{lang 'Privacy'}</a>
      <a href="{{ $design->url('page','main','legalnotice') }}" title="{lang 'Legal Notice'}" data-load="ajax">{lang 'Legal Notice'}</a>

      {if !$is_user_auth AND $is_newsletter_enabled}
        <a href="{{ $design->url('newsletter','home','subscription') }}" title="{lang 'Subscribe to our newsletter!'}" data-popup="block-page">{lang 'Newsletter'}</a>
      {/if}
      {if $is_invite_enabled}
        <a rel="nofollow" href="{{ $design->url('invite','home','invitation') }}" title="{lang 'Invite your friends!'}" data-popup="block-page">{lang 'Invite'}</a>
      {/if}

      <a href="{{ $design->url('xml','sitemap','index') }}" title="{lang 'Site Map'}" data-load="ajax">{lang 'Site Map'}</a>
      <a href="{{ $design->url('contact','contact','index') }}" title="{lang 'Contact Us'}">{lang 'Contact'}</a>
      <a href="{{ $design->url('page','main','link') }}" title="{lang 'Links'}" data-load="ajax">{lang 'Links'}</a>
  </nav>
