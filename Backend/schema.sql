
CREATE TABLE citations (
    id SERIAL PRIMARY KEY,
    citation_text TEXT NOT NULL,
    citation_url TEXT
);

CREATE TABLE functions_dim_1_nf (
    function_id SERIAL PRIMARY KEY,
    base_field_label TEXT NOT NULL,
    sigma_one INTEGER NOT NULL,
    sigma_two INTEGER NOT NULL,
    ordinal INTEGER NOT NULL,
    citations INTEGER[] DEFAULT ARRAY[]::INTEGER[]
);

CREATE TABLE graphs_dim_1_nf (
    graph_id SERIAL PRIMARY KEY,
    cardinality INTEGER,
    periodic_cycles INTEGER,
    preperiodic_components INTEGER,
    max_tail INTEGER
);

CREATE TABLE rational_preperiodic_dim_1_nf (
    id SERIAL PRIMARY KEY,
    function_id INTEGER NOT NULL REFERENCES functions_dim_1_nf(function_id) ON DELETE CASCADE,
    graph_id INTEGER NOT NULL REFERENCES graphs_dim_1_nf(graph_id) ON DELETE CASCADE,
    rational_value NUMERIC,
    preperiodic_flag BOOLEAN
);


INSERT INTO citations (citation_text, citation_url) VALUES ('Follow ever Mr ahead reflect lot.', 'https://www.king-williams.com/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Student learn day region market free either need.', 'http://www.martinez-turner.com/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Field southern inside.', 'https://patel.com/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Who knowledge pretty scene heart kind treatment.', 'http://strickland.info/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Goal economy fine democratic worker service develop.', 'http://www.griffith-lopez.biz/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Care political parent marriage help phone bag character.', 'https://lucas.info/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Every law cover green local animal upon.', 'https://www.ortiz.biz/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Kitchen charge lot.', 'http://www.johnson.biz/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Tv where new bad.', 'https://johnson.net/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Teacher get shake statement art.', 'http://adams.com/');
INSERT INTO citations (citation_text, citation_url) VALUES ('And than ask political together practice but all.', 'https://www.camacho-solomon.com/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Hundred employee college see.', 'http://www.ross-robinson.net/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Head finish over evidence strong.', 'https://sullivan.net/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Upon very training only high create lot.', 'http://www.wood.info/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Music approach oil term card expert scientist child.', 'https://www.peterson-hammond.biz/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Despite information author her watch scientist either.', 'http://www.gross.com/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Low deep write table.', 'http://brady-kennedy.com/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Everyone any radio.', 'https://clark.com/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Film choice analysis next accept.', 'http://www.crawford-burch.com/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Church finally agree fight strong result clear.', 'http://lopez.biz/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Ever cultural all increase important prepare eat.', 'https://www.sampson.com/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Visit fill example effort.', 'https://www.price.biz/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Do world detail modern western particular he.', 'https://guerrero.com/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Artist which than medical seat.', 'http://www.hansen.info/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Thank machine election indicate write trip.', 'https://www.simpson.biz/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Ever pattern specific particular young.', 'https://www.schultz-jackson.org/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Future strategy cell this hear hard simply theory.', 'http://duncan-diaz.com/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Ball risk interesting cost.', 'http://harrison-huynh.com/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Particularly authority best apply might.', 'http://www.mcneil-hicks.com/');
INSERT INTO citations (citation_text, citation_url) VALUES ('Think six after office.', 'https://carter.com/');

INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('though', 10, 2, 1, '{25}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('pass', 2, 9, 2, '{2}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('clear', 4, 9, 3, '{11}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('single', 4, 5, 4, '{22}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('blue', 4, 3, 5, '{19}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('happy', 4, 2, 6, '{1}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('able', 5, 3, 7, '{18}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('stand', 5, 2, 8, '{17}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('decade', 8, 3, 9, '{1}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('window', 2, 5, 10, '{15}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('plan', 10, 8, 11, '{7}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('measure', 1, 4, 12, '{27}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('dog', 9, 6, 13, '{23}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('behavior', 8, 1, 14, '{2}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('because', 9, 1, 15, '{24}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('right', 2, 1, 16, '{24}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('seat', 4, 5, 17, '{22}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('find', 8, 6, 18, '{15}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('professional', 8, 8, 19, '{12}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('window', 5, 7, 20, '{7}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('choice', 3, 2, 21, '{7}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('believe', 5, 9, 22, '{19}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('cost', 9, 8, 23, '{26}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('figure', 6, 8, 24, '{10}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('house', 4, 9, 25, '{4}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('with', 8, 8, 26, '{4}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('leave', 9, 9, 27, '{29}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('practice', 9, 6, 28, '{19}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('fast', 5, 7, 29, '{5}');
INSERT INTO functions_dim_1_nf (base_field_label, sigma_one, sigma_two, ordinal, citations) VALUES ('west', 6, 5, 30, '{28}');

INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (8, 3, 3, 9);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (10, 3, 4, 7);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (7, 2, 5, 9);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (6, 1, 2, 6);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (8, 0, 1, 4);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (3, 1, 5, 4);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (2, 0, 0, 10);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (3, 0, 3, 4);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (4, 0, 2, 1);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (3, 3, 3, 7);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (9, 3, 4, 4);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (5, 4, 5, 2);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (10, 4, 5, 5);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (2, 0, 0, 1);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (6, 0, 4, 8);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (6, 4, 1, 1);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (6, 3, 1, 8);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (4, 0, 4, 2);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (8, 2, 3, 9);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (7, 3, 5, 1);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (5, 4, 3, 1);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (1, 4, 5, 3);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (4, 5, 1, 8);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (3, 5, 5, 6);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (5, 2, 2, 2);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (10, 3, 4, 7);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (1, 2, 3, 2);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (8, 3, 1, 8);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (3, 3, 0, 10);
INSERT INTO graphs_dim_1_nf (cardinality, periodic_cycles, preperiodic_components, max_tail) VALUES (10, 5, 3, 10);

INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (23, 4, 4.15, false);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (18, 17, 1.23, false);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (11, 9, 2.57, true);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (30, 2, 2.82, false);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (11, 29, 0.66, false);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (13, 26, 4.39, false);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (11, 16, 2.38, true);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (3, 1, 2.67, false);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (29, 28, 1.74, true);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (13, 30, 4.62, false);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (21, 26, 3.2, true);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (10, 21, 0.59, true);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (26, 25, 4.8, true);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (12, 19, 1.32, false);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (18, 13, 3.38, true);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (18, 28, 0.92, false);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (26, 29, 4.81, false);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (6, 29, 4.96, true);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (18, 7, 4.37, false);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (18, 11, 1.6, false);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (11, 27, 2.36, true);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (21, 13, 4.6, false);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (16, 11, 4.01, true);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (19, 2, 3.79, true);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (13, 4, 4.98, false);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (11, 4, 4.76, false);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (23, 20, 1.18, false);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (24, 27, 4.12, true);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (10, 16, 2.0, true);
INSERT INTO rational_preperiodic_dim_1_nf (function_id, graph_id, rational_value, preperiodic_flag) VALUES (5, 17, 0.31, false);