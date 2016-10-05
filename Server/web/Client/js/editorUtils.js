/**
 * Created by Dennis on 26.09.2016.
 */

var numberOfEditors;

var editors;

/**
 * Initializes all editors, sets the 'numberOfEditors' variable to editorNr
 *     and puts all editor objects into the array 'editors'.
 *     The html markup for all editors and toolbars must be present in the html document
 *     and the editable content and toolbar containers need to have IDs using following naming schemes:
 *     - editable content contaners:    'editor<number of editor>'
 *     - toolbars:                       'toolbar<number of editor>'
 *     (so toolbar and editable content container that belong to the same editor have the same number).
 *
 *     Call only once when page is loaded!
 *
 * @param editorNr the amount of editors that shall be initialized
 */
function initEditors(editorNr) {

    if(editorNr) {

        numberOfEditors = editorNr;
        editors = [];

        for(var i = 0; i < numberOfEditors; i++) {

            var editorId = 'editor' + i;
            var toolbarId = 'toolbar' + i;

            addEditor(editorId, toolbarId);

            $('#section' + i).find('.remove-btn').click(createOnclickFunction(i));
        }
    }
}

function createOnclickFunction(index) {
    return function() {removeSection(index);};
}

/**
 * adds a new editor at the end of the 'editors' array
 * @param editorId the id of the editable content container of the new editor
 * @param toolbarId the id of the toolbar of the new editor
 */
function addEditor(editorId, toolbarId) {

    if(editors && numberOfEditors) {

        var editor = new wysihtml5.Editor(editorId, {
            toolbar: toolbarId,
            parserRules: wysihtml5ParserRules
        });

        editors.push(editor);
    }
}

/**
 * adds a new editor at a specified position to the 'editors' array
 * @param editorId editorId the id of the editable content container of the new editor
 * @param toolbarId toolbarId the id of the toolbar of the new editor
 * @param position position of the new editor in the 'editors' array
 */
function addEditorAt(editorId, toolbarId, position) {

    if(editors && numberOfEditors) {

        var oldEditors = editors;

        editors = [];

        for (var i = 0; i < position; i++) {
            editors[i] = oldEditors[i];
        }

        addEditor(editorId, toolbarId);

        numberOfEditors++;

        for (var j = position + 1; j < numberOfEditors; j++) {
            editors[j] = oldEditors[j];
        }
    }
}

/**
 * removes the editor at the specified index from the 'editors' array
 * @param index index of the editor that shall be removed
 */
function removeEditor(index) {

    if(editors && numberOfEditors) {
        editors[index] = null;
    }
}

/**
 * puts content of all editable divs into a single json object and returns
 * this object as a string
 */
function getContentAsJsonString() {

    if(editors && numberOfEditors) {
        
        var sections = [];

        for (var i = 0; i < numberOfEditors; i++) {

            if (editors[i] && editors[i] != null) {

                var item = {};

                item["section"] = editors[i].getValue(true).trim();

                sections.push(item);
            }
        }

        var jsonObj = {};
        jsonObj["content"] = sections;

        return JSON.stringify(jsonObj);
    }
}

function removeSection(sectionNr) {

    removeEditor(sectionNr);

    $('#section' + sectionNr).remove();

    console.log('removed editor nr: ' + sectionNr);
    console.log(editors[sectionNr]);
}

function addSection() {

    $.get('/Client/out/components/editor-toolbar.html',
        function(data){

            $('#main-content').append(createJumbotron(data));
            addEditor('editor' + numberOfEditors, 'toolbar' + numberOfEditors);

            var section = $('#section' + numberOfEditors);
            section.find('.remove-btn').click(createOnclickFunction(numberOfEditors));
            section.find('.update-btn').click(function(event) {
                saveContent(event);
            });
            numberOfEditors++;

    }, 'html')
}

function createJumbotron(toolbar) {

    var jumbotron = document.createElement('div');
    jumbotron.className = 'jumbotron';
    jumbotron.id = 'section' + numberOfEditors;

    var container = document.createElement('div');
    container.className = 'container';

    var row = document.createElement('div');
    row.className = 'row';

    var editorCol = document.createElement('div');
    editorCol.className = 'col-lg-12 line-break';
    editorCol.id = 'editor' + numberOfEditors;
    editorCol.setAttribute('data-placeholder', 'Neuen Abschnitt hier bearbeiten');

    row.appendChild(editorCol);
    container.appendChild(row);

    var row2 = document.createElement('div');
    row2.className = 'row';

    var toolbarCol = document.createElement('div');
    toolbarCol.id = 'toolbar' + numberOfEditors;
    toolbarCol.className = 'edy-tb col-lg-12 btn-toolbar';
    toolbarCol.setAttribute('role', 'toolbar');
    toolbarCol.innerHTML = toolbar;

    row2.appendChild(toolbarCol);
    container.appendChild(row2);

    jumbotron.appendChild(container);

    return jumbotron;

}