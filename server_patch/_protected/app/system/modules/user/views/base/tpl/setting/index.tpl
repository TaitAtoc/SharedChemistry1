<style>
main#content:has(ol#toc) {
    padding-top: 140px !important;
    padding-bottom: 80px !important;
}

@media (max-width: 767px) {
    main#content:has(ol#toc) {
        padding-top: 100px !important;
        padding-bottom: 70px !important;
    }
}
</style>

<ol id="toc">
    <li>
        <a href="#edit">
            <span>{lang 'Edit'}</span>
        </a>
    </li>
    <li>
        <a href="#avatar">
            <span>{lang 'Profile Photo'}</span>
        </a>
    </li>
    <li>
        <a href="#privacy">
            <span>{lang 'Privacy'}</span>
        </a>
    </li>
    <li>
        <a href="#pwd">
            <span>{lang 'Password'}</span>
        </a>
    </li>
    <li>
        <a href="#delete">
            <span>{lang 'Delete Account'}</span>
        </a>
    </li>
</ol>

<div class="content" id="edit">
    {manual_include 'edit.tpl'}
</div>

<div class="content" id="avatar">
    {manual_include 'avatar.tpl'}
</div>

<div class="content" id="privacy">
    {manual_include 'privacy.tpl'}
</div>

<div class="content" id="pwd">
    {manual_include 'password.tpl'}
</div>

<div class="content" id="delete">
    <section class="sc-settings-delete-card">
        <h2>{lang 'Delete Account'}</h2>
        <p>{lang 'This opens the existing account deletion confirmation flow.'}</p>
        <a class="btn sc-settings-delete-button" href="{{ $design->url('user','setting','delete') }}">
            {lang 'Continue to Delete Account'}
        </a>
    </section>
</div>

<script>
(function() {
    var allowed = ['edit', 'avatar', 'privacy', 'pwd', 'delete'];
    var labels = {
        edit: 'Edit',
        avatar: 'Profile Photo',
        privacy: 'Privacy',
        pwd: 'Password',
        delete: 'Delete Account'
    };

    function getSettingsRoot() {
        var toc = document.querySelector('main#content ol#toc');

        return toc ? toc.closest('main#content') : null;
    }

    function getTargetFromHash() {
        var hash = window.location.hash.replace(/^#/, '');
        var match = /^p=([^&]+)/.exec(hash);
        var target = match ? match[1] : hash;

        return allowed.indexOf(target) !== -1 ? target : 'edit';
    }

    function getTargetFromLink(link) {
        var hash;
        var match;

        if (!link || !link.hash) {
            return '';
        }

        hash = link.hash.replace(/^#/, '');
        match = /^p=([^&]+)/.exec(hash);

        return match ? match[1] : hash;
    }

    function setClass(element, isActive) {
        if (!element) {
            return;
        }

        element.classList.toggle('active', isActive);
        element.classList.toggle('inactive', !isActive);
    }

    function showPanel(target) {
        var root = getSettingsRoot();
        var toc = root ? root.querySelector('ol#toc') : null;

        if (!root || !toc || allowed.indexOf(target) === -1) {
            target = 'edit';
        }

        allowed.forEach(function(id) {
            var panel = root ? root.querySelector('div.content#' + id) : null;
            var link = toc ? toc.querySelector('a[href="#' + id + '"]') : null;
            var active = id === target;

            if (panel) {
                setClass(panel, active);
                panel.style.display = active ? '' : 'none';
                panel.setAttribute('aria-hidden', active ? 'false' : 'true');
            }

            if (link) {
                setClass(link, active);
                link.setAttribute('aria-current', active ? 'page' : 'false');
                if (labels[id]) {
                    link.setAttribute('aria-label', labels[id]);
                }
            }
        });
    }

    function wireSettingsNav() {
        var root = getSettingsRoot();
        var toc = root ? root.querySelector('ol#toc') : null;

        if (!toc) {
            return;
        }

        allowed.forEach(function(id) {
            var link = toc.querySelector('a[href="#' + id + '"]');

            if (!link) {
                return;
            }

            link.addEventListener('click', function(event) {
                var target = getTargetFromLink(link);

                if (allowed.indexOf(target) === -1) {
                    return;
                }

                event.preventDefault();
                showPanel(target);

                if (window.location.hash !== '#p=' + target) {
                    window.location.hash = 'p=' + target;
                }
            });
        });
    }

    wireSettingsNav();
    showPanel(getTargetFromHash());

    window.addEventListener('hashchange', function() {
        showPanel(getTargetFromHash());
    });
}());
</script>
