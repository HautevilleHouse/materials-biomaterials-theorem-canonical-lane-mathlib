import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure MechanicalTestingPackage where
  tensileStrength : Type u
  yieldStress : Type v
  elasticModulus : Prop
  poissonRatio : Prop
  hardness : Prop
  fatigueLimit : Prop

structure MechanicalTestingEvidence (M : MechanicalTestingPackage) where
  elasticModulusClosed : M.elasticModulus
  poissonRatioClosed : M.poissonRatio
  hardnessClosed : M.hardness
  fatigueLimitClosed : M.fatigueLimit

def MechanicalTestingClosed (M : MechanicalTestingPackage) : Prop :=
  M.elasticModulus ∧ M.poissonRatio ∧ M.hardness ∧ M.fatigueLimit

theorem mechanical_testing_closed_from_evidence (M : MechanicalTestingPackage) (E : MechanicalTestingEvidence M) :
  MechanicalTestingClosed M := by
  exact And.intro E.elasticModulusClosed (And.intro E.poissonRatioClosed (And.intro E.hardnessClosed E.fatigueLimitClosed))

end MaterialsBiomaterialsTheoremCanonicalLaneLean
end HautevilleHouse
