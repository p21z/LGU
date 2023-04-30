Solidres = window.Solidres || {};
Solidres.InlineEdit = function (selector, config) {
    config = config || {};
    const createLoader = function () {
        const span = document.createElement('span');
        Object.assign(span.style, {
            backgroundImage: 'url(' + Joomla.getOptions('system.paths').root + '/media/com_solidres/assets/images/ajax-loader2.gif)',
            backgroundRepeat: 'no-repeat',
            backgroundSize: 'contain',
            width: '25px',
            height: '14px',
            display: 'inline-block',
        })

        return span;
    };
    const editable = function (element) {
        const { type, name, value } = element.dataset;
        const container = document.createElement('div');
        container.className = 'input-group d-none';
        const node = document.createElement(type);
        let isLoading = false;
        node.name = name;
        switch (type) {
            case 'select':
                if (Array.isArray(config.source)) {
                    for (const option of config.source) {
                        const opt = document.createElement('option');
                        opt.value = option.value;
                        opt.innerText = option.text;

                        if (value == option.value) {
                            opt.selected = true;
                        }

                        node.appendChild(opt);
                    }
                }

                node.classList.add('form-select', 'form-select-sm');
                break;

            case 'input':
            case 'textarea':

                if (typeof value !== 'undefined') {
                    node.value = value;
                }

                node.classList.add('form-control', 'form-control-sm');
                break;
        }

        container.appendChild(node);
        // Button Close
        const btnClose = document.createElement('button');
        btnClose.type = 'button';
        btnClose.className = 'btn btn-sm btn-danger';
        btnClose.innerHTML = '<span class="icon-times" aria-hidden="true"></span>';
        btnClose.addEventListener('click', e => {
            e.preventDefault();
            element.classList.remove('d-none');
            container.classList.add('d-none');
        }, false);

        // Button OK
        const btnOk = document.createElement('button');
        btnOk.type = 'button';
        btnOk.className = 'btn btn-sm btn-primary';
        btnOk.innerHTML = '<span class="icon-save" aria-hidden="true"></span>';
        btnOk.addEventListener('click', e => {
            e.preventDefault();

            if (typeof config.url === 'string') {
                isLoading = true;
                const loader = createLoader();
                element.parentNode.insertBefore(loader, element);
                const onDone = () => {
                    isLoading = false;
                    loader.parentNode.removeChild(loader);
                };
               window.Joomla?.request({
                    // Find the action url associated with the form - we need to add the token to this
                    url: config.url,
                    method: 'POST',
                    data: new URLSearchParams({ ...element.dataset, value: node.value }).toString(),
                    onSuccess: response => {
                        onDone();
                        let text = node.value;

                        if (type === 'select' && Array.isArray(config.source)) {
                            for (const option of config.source) {
                                if (option.value == node.value) {
                                    text = option.text;
                                    break;
                                }
                            }
                        }

                        element.innerText = text;

                        if (typeof config.success === 'function') {
                            if (typeof response === 'string' && ['{', '['].includes(response.trim()[0])) {
                                try {
                                    response = JSON.parse(response);
                                } catch {}
                            }

                            // Move container to body to reject the callback reset element content
                            document.body.appendChild(container);
                            config.success.bind(element)(response, element);
                            setTimeout(() => {
                                // Revert container
                                element.appendChild(container);
                            }, 0);
                        }
                    },
                    onError: () => {
                        onDone();
                        if (typeof config.error === 'function') {
                            config.error();
                        }
                    }
                });
            }

            btnClose.click();
        }, false);

        container.appendChild(btnOk);
        container.appendChild(btnClose);
        element.style.position = 'relative';
        element.style.overflow = 'visible';
        Object.assign(container.style, {
            position: 'absolute',
            left: '0px',
            top: '100%',
            width: '230px',
            zIndex: '100',
        })
        element.appendChild(container);
        element.addEventListener('click', e => {
            e.preventDefault();

            if (!isLoading && e.target !== container && !container.contains(e.target)) {
                container.classList.toggle('d-none');
            }
        }, false);

        if (typeof config.initContainer === 'function') {
            config.initContainer(container);
        }
    }

    document.querySelectorAll(selector).forEach(editable);
}