import canonicalLaneMathlib.AdmissibleClass
import MaterialsBiomaterialsTheoremCanonicalLaneLean.CrystallographyPhaseDiagram
import MaterialsBiomaterialsTheoremCanonicalLaneLean.ElasticityFracture
import MaterialsBiomaterialsTheoremCanonicalLaneLean.BiomaterialInterface

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

def ConstrainedMaterialsBiomaterialsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_materials_biomaterials_endgame (A : AdmissibleClass) :
    ConstrainedMaterialsBiomaterialsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MaterialsBiomaterialsTheoremCanonicalLaneLean
end HautevilleHouse